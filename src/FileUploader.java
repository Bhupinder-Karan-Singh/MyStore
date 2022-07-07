import java.io.*;
import java.io.FileOutputStream;

import javax.servlet.http.Part;

import javax.servlet.ServletException;
import javax.servlet.http.*;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.Part;

public class FileUploader {

    public static String savefileonserver(Part part, String abspath) {
        try {
            //File Upload Logic
            //Part part1= request.getPart("fn");

            String filename = getFileName(part);
            long filesize = part.getSize();

            System.out.println("File Name " + filename);
            System.out.println("File Size " + filesize);
            if (filename == null) {
                return "not-a-file";
            } else {
                //Write file and return filename  
                DataInputStream dis = new DataInputStream(part.getInputStream());
                FileOutputStream fos = new FileOutputStream(abspath + "/" + filename);

                byte b[] = new byte[10000];
                long count = 0;
                int r;

                while (true) {
                    r = dis.read(b, 0, 10000);
                    count = count + r;
                    fos.write(b, 0, r);

                    if (count == filesize) {
                        break;
                    }
                }

                fos.close();

                return filename;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            return ex.getMessage();
        }
    }

    public static String savefileonserver(Part photo, String abspath, String newfilenameonserver) {
        try {
            //File Upload Logic
            //Part part1= request.getPart("fn");

            String filename = getFileName((Part) photo);
            long filesize = photo.getSize();

            System.out.println("File Name " + filename);
            System.out.println("File Size " + filesize);
            if (filename == null) {
                return "not-a-file";
            } else {

                //String extension = filename.substring(filename.lastIndexOf("."));
                //Write file and return filename  
                //filename = newfilenameonserver + extension;
                filename = newfilenameonserver;
                DataInputStream dis = new DataInputStream(photo.getInputStream());
                FileOutputStream fos = new FileOutputStream(abspath + "/" + filename);

                byte b[] = new byte[10000];
                long count = 0;
                int r;

                while (true) {
                    r = dis.read(b, 0, 10000);
                    count = count + r;
                    fos.write(b, 0, r);

                    if (count == filesize) {
                        break;
                    }
                }

                fos.close();

                return filename;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            return ex.getMessage();
        }
    }

    private static String getFileName(final Part part) {
        final String partHeader = part.getHeader("content-disposition");

        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(
                        content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }
}
