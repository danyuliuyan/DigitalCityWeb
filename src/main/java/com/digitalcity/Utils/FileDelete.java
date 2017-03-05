package com.digitalcity.Utils;

/**
 * Created by dushang on 17/3/5.
 */
import java.io.File;

public class FileDelete {
    /**
     * 删除空目录
     * @param dir 将要删除的目录路径
     */
    private static void doDeleteEmptyDir(String dir) {
        boolean success = (new File(dir)).delete();
        if (success) {
            System.out.println("Successfully deleted empty directory: " + dir);
        } else {
            System.out.println("Failed to delete empty directory: " + dir);
        }
    }

    /**
     * 删除某个目录及目录下的所有子目录和文件
     *
     * 关键方法 File.delete()用于删除“某个文件或者空目录”！
     *
     * @return
     */
    public static boolean deleteCatalogAndFiles(String dir)
    {
        File file = new File(dir);
        if (file.isDirectory())
        {
            String[] children = file.list();//文件夹目录列表
            for (String child : children)
            {
                boolean success = deleteCatalogAndFiles(dir +"/"+ child);
                if (!success)
                {
                    return false;
                }
            }
        }
        return file.delete();
    }
    /**
     *测试
     */
    public static void main(String[] args) {
//        doDeleteEmptyDir("new_dir1");
        String newDir2 = "F:\\test";
        boolean success = deleteCatalogAndFiles(newDir2);
        if (success) {
            System.out.println("Successfully deleted populated directory: " + newDir2);
        } else {
            System.out.println("Failed to delete populated directory: " + newDir2);
        }
    }
}