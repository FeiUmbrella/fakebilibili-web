import { gteossSTS } from "@/apis/commonality"
import { useGlobalStore } from "@/store/main"
import { FileUpload, OssSTSInfo } from "@/types/idnex"
import COS from "cos-js-sdk-v5"
import { fileHash, fileSuffix } from "./fileManipulation"

// 保留函数名，避免影响现有调用方。
export const initOssSTS = async (_interface: string): Promise<OssSTSInfo> => {
    return new Promise((resolve, reject) => {
        const globalStore = useGlobalStore()
        gteossSTS()
            .then((res) => {
                if (res.code !== 200 || !res.data) {
                    reject(res)
                    return
                }
                const info = res.data
                globalStore.setOssInfo(<OssSTSInfo>{
                    region: info.region,
                    bucket: info.bucket,
                    expirationTime: info.expiration_time,
                    secretId: info.secret_id || info.access_key_id,
                    secretKey: info.secret_key || info.access_key_secret,
                    sessionToken: info.session_token || info.sts_token,
                    accessKeyId: info.access_key_id,
                    accessKeySecret: info.access_key_secret,
                    stsToken: info.sts_token
                })
                resolve(globalStore.ossData)
            })
            .catch((err) => reject(err))
    })
}

export const ossUpload = (file: File, uploadConfig: FileUpload, dir: string, fragment: boolean): Promise<{ path: string }> => {
    return new Promise((resolve, reject) => {
        initOssSTS(uploadConfig.interface)
            .then(async (stsInfo) => {
                const name = await fileHash(file) + fileSuffix(file.name)
                const key = `${dir}${name}`
                const cos = new COS({
                    SecretId: stsInfo.secretId || "",
                    SecretKey: stsInfo.secretKey || "",
                    SecurityToken: stsInfo.sessionToken || ""
                })

                const onProgress = (progressData: any) => {
                    uploadConfig.progress = Math.round((progressData.percent || 0) * 100)
                }

                const commonParams = {
                    Bucket: stsInfo.bucket,
                    Region: stsInfo.region,
                    Protocol: "https:",
                    Key: key,
                    Body: file,
                    onProgress
                }

                if (fragment) {
                    cos.sliceUploadFile(commonParams, (err: any) => {
                        if (err) {
                            reject({ msg: "上传失败" })
                            return
                        }
                        resolve({ path: key })
                    })
                    return
                }

                cos.putObject(commonParams, (err: any) => {
                    if (err) {
                        reject({ msg: "上传失败" })
                        return
                    }
                    resolve({ path: key })
                })
            })
            .catch(() => reject({ msg: "上传失败" }))
    })
}
