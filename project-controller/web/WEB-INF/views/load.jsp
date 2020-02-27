<%--
  Created by IntelliJ IDEA.
  User: fangchengfangcheng
  Date: 2019-12-06
  Time: 15:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="/static/js/jquery-3.3.1.min.js"></script>
</head>
<body>
<form id="uploadForm" method="post"
      enctype="multipart/form-data">
    <input type="file" name="myfile" id="myfile" multiple="multiple"/>
    <button href="#" class="tj btn btn-info" id="upload">提交</button>
</form>
<a href="/file/download?filename=41940e6e-162f-46f9-bcee-dbe6c2242509.jpg"> 下载</a>

<img src="/file/download?filename=hh.jpeg"/>


<%--<div id="tableUploader" class="uploader">--%>
<%--    <div class="uploader-message text-center">--%>
<%--        <div class="content"></div>--%>
<%--        <button type="button" class="close">×</button>--%>
<%--    </div>--%>
<%--    <table class="table table-bordered">--%>
<%--        <thead>--%>
<%--        <tr>--%>
<%--            <th colspan="2">文件名</th>--%>
<%--            <th style="width: 100px">大小</th>--%>
<%--            <th style="width: 160px; text-align: center;">状态/操作</th>--%>
<%--        </tr>--%>
<%--        </thead>--%>
<%--        <tbody class="uploader-files">--%>
<%--        <tr class="file template">--%>
<%--            <td style="width: 38px; padding: 3px"><div class="file-icon"></div></td>--%>
<%--            <td style="padding: 0">--%>
<%--                <div style="position: relative; padding: 8px;">--%>
<%--                    <strong class="file-name"></strong>--%>
<%--                    <div class="file-progress-bar"></div>--%>
<%--                </div>--%>
<%--            </td>--%>
<%--            <td><span class="file-size text-muted"></span></td>--%>
<%--            <td class="actions text-right" style="padding: 0 4px;">--%>
<%--                <div class="file-status" data-toggle="tooltip" style="margin: 8px;"><i class="icon"></i> <span class="text"></span></div>--%>
<%--                <a data-toggle="tooltip" class="btn btn-link btn-download-file" target="_blank"><i class="icon icon-download-alt"></i></a>--%>
<%--                <button type="button" data-toggle="tooltip" class="btn btn-link btn-reset-file" title="Repeat"><i class="icon icon-repeat"></i></button>--%>
<%--                <button type="button" data-toggle="tooltip" class="btn btn-link btn-rename-file" title="Rename"><i class="icon icon-pencil"></i></button>--%>
<%--                <button type="button" data-toggle="tooltip" title="Remove" class="btn btn-link btn-delete-file"><i class="icon icon-trash text-danger"></i></button>--%>
<%--            </td>--%>
<%--        </tr>--%>
<%--        </tbody>--%>
<%--        <tfoot>--%>
<%--        <tr>--%>
<%--            <td colspan="4" style="padding: 4px 0">--%>
<%--                <div style="position: relative;">--%>
<%--                    <div class="uploader-status pull-right text-muted" style="margin-top: 5px;"></div>--%>
<%--                    <button type="button" class="btn btn-link uploader-btn-browse"><i class="icon icon-plus"></i> 选择文件</button>--%>
<%--                    <button type="button" class="btn btn-link uploader-btn-start"><i class="icon icon-cloud-upload"></i> 开始上传</button>--%>
<%--                </div>--%>
<%--            </td>--%>
<%--        </tr>--%>
<%--        </tfoot>--%>
<%--    </table>--%>
<%--</div>--%>

<script>
    // $('#tableUploader').uploader({
    //     url: 'url/for/upload/file'
    // });
$(function () {


    $("#upload").click(function () {
        var formData = new FormData($("#uploadForm")[0]);
        $("#myfile").files[0];
        $.ajax({
            url:"/file/upload",
            data: formData,
            type:"POST",
            cache:false,
            processData:false,
            contentType:false,
            dataType:"json",
            success:function (data) {
                alert(data);
            },
            error:function (data) {
                alert("上传失败！");
            }
        });
    });
})

</script>
</body>
</html>
