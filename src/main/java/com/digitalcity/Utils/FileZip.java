package com.digitalcity.Utils;

import java.io.*;
import java.nio.charset.Charset;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;
import java.util.ArrayList;
import java.util.zip.ZipInputStream;

/**
 * Created by dushang on 17/3/4.
 */
public class FileZip {

    public static void  readZipFile(String filename)throws Exception {
        //得到zip文件
        ZipFile zipFile = new ZipFile(filename);
        //把文件转化为字节流
        InputStream inputStream = new BufferedInputStream(new FileInputStream(filename));
        ZipInputStream zipInputStream = new ZipInputStream(inputStream);
        ZipEntry zipEntry;

        String zipFileNameFirst = null;

        while ((zipEntry = zipInputStream.getNextEntry()) != null) {
            //判断zip文件里面的第一个文件是否是目录
            if (zipEntry.isDirectory()) {
                System.out.println("为目录 " + "目录名为" + zipEntry.getName());
                zipFileNameFirst = zipEntry.getName();
            } else {
                //不为目录
                int ZFNFnum = 0;
                if (zipFileNameFirst != null) {
                    ZFNFnum = zipFileNameFirst.length();
                }

                System.err.println("file- " + zipEntry.getName().substring(ZFNFnum) + " : " + zipEntry.getSize() + " bytes");

                long size = zipEntry.getSize();
                if (size > 0) {
                    BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(zipFile.getInputStream(zipEntry)));

                    String line;
                    while ((line = bufferedReader.readLine()) != null) {
                        System.out.println(line);
                    }
                    bufferedReader.close();
                }
            }
        }
    }

    /**
     * 解压缩
     * @param sZipPathFile
     * @param sDescDir
     * @return
     * @throws IOException
     */
    @SuppressWarnings("unchecked")
    public static void unZipFiles(String sZipPathFile,String sDescDir)throws IOException{
        long startTime=System.currentTimeMillis();

        try {

            //先指定压缩挡的位置和挡名，建立FileInputStream对象
            FileInputStream fins=new FileInputStream(sZipPathFile);

            //将fins传入ZipInputStream中
            ZipInputStream zins=new ZipInputStream(fins, Charset.forName("GBK"));
            ZipEntry ze=null;
            byte[] ch=new byte[256];
            while ((ze=zins.getNextEntry())!=null){
                File zfile=new File(sDescDir+ze.getName());
                File fpath=new File(zfile.getParentFile().getPath());
                if (ze.isDirectory()){


                    if (!zfile.exists()){
                        zfile.mkdirs();
                    }
                    zins.closeEntry();
                }else {

                    if (!fpath.exists())
                        fpath.mkdirs();

                    FileOutputStream fouts=new FileOutputStream(zfile);
                    int i;
                    while ((i=zins.read(ch))!=-1)
                        fouts.write(ch,0,i);

                    zins.closeEntry();
                    fouts.close();

                }
            }
            fins.close();
            zins.close();
        } catch (IOException e) {
            System.out.println("Extract error:"+e.getMessage());
        }
    }

    public static void main(String[] args) throws Exception{
        try {
            unZipFiles("D:\\pianohello.zip","D:\\hello\\/");
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
