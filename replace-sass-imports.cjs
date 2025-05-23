const fs = require("fs");
const path = require("path");

const directoryPath = path.join(__dirname, "./src/");

function restoreAndClean(dir) {
    const files = fs.readdirSync(dir);

    for (const file of files) {
        const fullPath = path.join(dir, file);
        const stat = fs.statSync(fullPath);

        if (stat.isDirectory()) {
            restoreAndClean(fullPath);
        } else if (file.endsWith(".vue.bak")) {
            const originalFile = fullPath.replace(/\.bak$/, "");
            try {
                // 覆盖原文件
                fs.copyFileSync(fullPath, originalFile);
                // 删除备份文件
                fs.unlinkSync(fullPath);
                console.log(`恢复并删除备份: ${originalFile}`);
            } catch (err) {
                console.error(`操作失败: ${originalFile}`, err);
            }
        }
    }
}

restoreAndClean(directoryPath);
console.log("✅ 所有 .vue.bak 文件已恢复并删除备份");
