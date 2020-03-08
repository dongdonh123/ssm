<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>FullCalendar Example</title>
    <link rel=" shortcut icon" href="/include/image/favicon.ico">

    <link rel="stylesheet" href="/include/vendor/css/fullcalendar.min.css" />
    <link rel="stylesheet" href="/include/vendor/css/bootstrap.min.css">
    <link rel="stylesheet" href='/include/vendor/css/select2.min.css' />
    <link rel="stylesheet" href='/include/vendor/css/bootstrap-datetimepicker.min.css' />
    
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,500,600&">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

    <link rel="stylesheet" href="/include/css/main.css">

</head>
<body>
    <div class="container">
        <!-- ���� Ŭ���� �޴����� -->
        <div id="contextMenu" class="dropdown clearfix">
            <ul class="dropdown-menu dropNewEvent" role="menu" aria-labelledby="dropdownMenu"
                style="display:block;position:static;margin-bottom:5px;">
                <li><a tabindex="-1" href="#">�б����� �߰�</a></li>
                <li class="divider"></li>
                <li><a tabindex="-1" href="#" data-role="close">Close</a></li>
            </ul>
        </div>

        <div id="wrapper">
            <div id="loading"></div>
            <div id="calendar"></div>
        </div>


        <!-- ���� �߰� MODAL -->
        <div class="modal fade" tabindex="-1" role="dialog" id="eventModal">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title"></h4>
                    </div>
                    
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-allDay">�Ϸ�����</label>
                                <input class='allDayNewEvent' id="edit-allDay" type="checkbox"></label>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-title">������</label>
                                <input class="inputModal" type="text" name="edit-title" id="edit-title"
                                    required="required" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-start">����</label>
                                <input class="inputModal" type="text" name="edit-start" id="edit-start" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-end">��</label>
                                <input class="inputModal" type="text" name="edit-end" id="edit-end" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-type">����</label>
                                <select class="inputModal" type="text" name="edit-type" id="edit-type">
                                    <option value="ī�װ�1">ī�װ�1</option>
                                    <option value="ī�װ�2">ī�װ�2</option>
                                    <option value="ī�װ�3">ī�װ�3</option>
                                    <option value="ī�װ�4">ī�װ�4</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-color">����</label>
                                <select class="inputModal" name="color" id="edit-color">
                                    <option value="#D25565" style="color:#D25565;">������</option>
                                    <option value="#9775fa" style="color:#9775fa;">�����</option>
                                    <option value="#ffa94d" style="color:#ffa94d;">��Ȳ��</option>
                                    <option value="#74c0fc" style="color:#74c0fc;">�Ķ���</option>
                                    <option value="#f06595" style="color:#f06595;">��ũ��</option>
                                    <option value="#63e6be" style="color:#63e6be;">���λ�</option>
                                    <option value="#a9e34b" style="color:#a9e34b;">�ʷϻ�</option>
                                    <option value="#4d638c" style="color:#4d638c;">����</option>
                                    <option value="#495057" style="color:#495057;">������</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-desc">����</label>
                                <textarea rows="4" cols="50" class="inputModal" name="edit-desc"
                                    id="edit-desc" ></textarea>
                            </div>
                        </div>
                    </div>
                    
                    <div class="modal-footer modalBtnContainer-addEvent">
                        <button type="button" class="btn btn-default" data-dismiss="modal">���</button>
                        <button type="button" class="btn btn-primary" id="save-event">����</button>
                    </div>
                    <div class="modal-footer modalBtnContainer-modifyEvent">
                        <button type="button" class="btn btn-default" data-dismiss="modal">�ݱ�</button>
                        <button type="button" class="btn btn-danger" id="deleteEvent">����</button>
                        <button type="button" class="btn btn-primary" id="updateEvent">����</button>
                    </div>
                    
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->

        <div class="panel panel-default">

            

           
        </div>
        <!-- /.filter panel -->
    </div>
    <!-- /.container -->

    <script src="/include/vendor/js/jquery.min.js"></script>
    <script src="/include/vendor/js/bootstrap.min.js"></script>
    <script src="/include/vendor/js/moment.min.js"></script>
    <script src="/include/vendor/js/fullcalendar.min.js"></script>
    <script src="/include/vendor/js/ko.js"></script>
    <script src="/include/vendor/js/select2.min.js"></script>
    <script src="/include/vendor/js/bootstrap-datetimepicker.min.js"></script>
    
    <script src="/include/js/main.js"></script>
    <script src="/include/js/addEvent.js"></script>
    <script src="/include/js/editEvent.js"></script>
    <script src="/include/js/etcSetting.js"></script>
</body>
</html>