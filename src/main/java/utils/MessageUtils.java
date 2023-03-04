package utils;

import javax.servlet.http.HttpServletRequest;

public class MessageUtils {
    public static void showMessage(HttpServletRequest req) {
        if (req.getParameter("message")!= null){
            String messageResponse ="";
            String message = req.getParameter("message");
            String alert = "";
            if(message.equals("InsertSuccess")){
                messageResponse = "Thêm mới thành công";
                alert = "success";
            }else if(message.equals("UpdateSuccess")){
                messageResponse = "Cập nhật thành công";
                alert = "success";
            }else if(message.equals("DeleteSuccess")){
                messageResponse = "Xóa thành công";
                alert = "success";
            }else if(message.equals("InsertError")){
                messageResponse = "Thêm mới thất bại";
                alert = "danger";
            }else if(message.equals("UpdateError")){
                messageResponse = "Cập nhật thất bại";
                alert = "danger";
            }else if(message.equals("DeleteError")){
                messageResponse = "Xóa thất bại";
                alert = "danger";
            }
            req.setAttribute("messageResponse", messageResponse);
            req.setAttribute("alert", alert);
        }
    }
}
