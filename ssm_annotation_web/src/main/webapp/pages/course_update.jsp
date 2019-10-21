<%@ page import="com.alibaba.druid.support.json.JSONUtils" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: rainbow
  Date: 2019-08-30
  Time: 17:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>

<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>修改</title>
    <meta name="description" content="修改">
    <meta name="keywords" content="修改">

    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">

    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>



    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/iCheck/square/blue.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/morris/morris.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/datepicker/datepicker3.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.theme.default.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/select2/select2.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/colorpicker/bootstrap-colorpicker.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap-markdown/css/bootstrap-markdown.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/adminLTE/css/AdminLTE.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/adminLTE/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.skinNice.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap-slider/slider.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.css">
</head>

<body class="hold-transition skin-purple sidebar-mini" >
<div id="course_update_app">

    <div class="wrapper">

        <jsp:include page="header.jsp"></jsp:include>
        <jsp:include page="aside.jsp"></jsp:include>


        <div class="content-wrapper">

            <!-- 内容头部 -->
            <section class="content-header">
                <h1>
                    数据管理
                    <small>数据修改</small>
                </h1>
                <%--<ol class="breadcrumb">--%>
                    <%--<li><a href="#"><i class="fa fa-dashboard"></i> 首页</a></li>--%>
                    <%--<li><a href="#">数据管理</a></li>--%>
                    <%--<li class="active">数据列表</li>--%>
                <%--</ol>--%>
            </section>
            <!-- 内容头部 /-->

            <!-- 正文区域 -->
            <section class="content">
                <!-- .box-body -->
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">修改分数</h3>
                    </div>
                    <div class="box-body">
                        <!-- 数据表格 -->
                        <div class="table-box" style="overflow-x: auto;" >
                            <!--基础控件-->
                            <form action="${pageContext.request.contextPath}/student/updateStuCou.do" method="post">
                            <div class="tab-pane" id="tab-common">
                                <div class="row data-type">

                                    <div class="col-md-2 title">课程id</div>
                                    <div class="col-md-4 data">
                                        <%--<select name="cid" @change="changeCid()" v-model="studentCourse.cid" class="form-control" style="width: 100%;">--%>
                                            <%--<option v-for="(course,index) in courseList">{{course.cid}}</option>--%>
                                        <%--</select>--%>
                                        <input type="text" class="form-control" placeholder="" name="cid" v-model="studentCourse.cid" readonly>
                                    </div>

                                    <div class="col-md-2 title">课程名</div>
                                    <div class="col-md-4 data">
                                        <%--<select disabled name="cname" @change="changeCname()" v-model="studentCourse.cname" class="form-control" style="width: 100%;">--%>
                                            <%--<option v-for="(course,index) in courseList">{{course.cname}}</option>--%>
                                        <%--</select>--%>
                                        <input type="text" class="form-control" placeholder="" name="cname" v-model="studentCourse.cname" readonly>
                                    </div>

                                    <div class="col-md-2 title">学生id</div>
                                    <div class="col-md-4 data">
                                        <input type="text" class="form-control" placeholder="" name="sid" v-model="studentCourse.sid" readonly>
                                    </div>

                                    <div class="col-md-2 title">学生名</div>
                                    <div class="col-md-4 data">
                                        <input type="text" class="form-control" placeholder="" name="sname" v-model="studentCourse.sname" readonly>
                                    </div>

                                    <div class="col-md-2 title">老师id</div>
                                    <div class="col-md-4 data">
                                        <input type="text" class="form-control" placeholder="" name="tid" v-model="studentCourse.tid" readonly>
                                    </div>

                                    <div class="col-md-2 title">老师名</div>
                                    <div class="col-md-4 data">
                                        <input type="text" class="form-control" placeholder="" name="tname" v-model="studentCourse.tname" readonly>
                                    </div>

                                    <div class="col-md-2 title">分数</div>
                                    <div class="col-md-4 data">
                                        <input type="number" class="form-control" placeholder="" name="score" v-model="studentCourse.score">
                                    </div>
                                    <div class="col-md-6 title"></div>


                                    <div class="col-md-2 title"></div>
                                    <div class="col-md-10 data text-center">
                                        <button type="submit" class="btn bg-maroon" >保存</button>
                                        <button type="button" class="btn bg-default" onclick="history.back(-1);">返回</button>
                                    </div>

                                </div>
                            </div>
                            </form>
                            <!--基础控件/-->

                        </div>
                        <!-- 数据表格 /-->
                    </div>
                    <!-- /.box-body -->
                </div>
            </section>
            <!-- 正文区域 /-->

        </div>
        <!-- @@close -->
        <!-- 内容区域 /-->

        <jsp:include page="footer.jsp"/>

    </div>
</div>

<script src="${pageContext.request.contextPath}/js/con_username.js"></script>

<script src="${pageContext.request.contextPath}/node_modules/vue/dist/vue.js"></script>
<script src="${pageContext.request.contextPath}/node_modules/axios/dist/axios.js"></script>

<script src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/jQueryUI/jquery-ui.min.js"></script>
<script>
    $.widget.bridge('uibutton', $.ui.button);
</script>
<script src="${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/raphael/raphael-min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/morris/morris.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/sparkline/jquery.sparkline.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<script src="${pageContext.request.contextPath}/plugins/knob/jquery.knob.js"></script>
<script src="${pageContext.request.contextPath}/plugins/daterangepicker/moment.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.js"></script>
<script src="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.zh-CN.js"></script>
<script src="${pageContext.request.contextPath}/plugins/datepicker/bootstrap-datepicker.js"></script>
<script src="${pageContext.request.contextPath}/plugins/datepicker/locales/bootstrap-datepicker.zh-CN.js"></script>
<script src="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/fastclick/fastclick.js"></script>
<script src="${pageContext.request.contextPath}/plugins/iCheck/icheck.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/adminLTE/js/app.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.js"></script>
<script src="${pageContext.request.contextPath}/plugins/select2/select2.full.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.zh-CN.js"></script>
<script src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/bootstrap-markdown.js"></script>
<script src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/locale/bootstrap-markdown.zh.js"></script>
<script src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/markdown.js"></script>
<script src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/to-markdown.js"></script>
<script src="${pageContext.request.contextPath}/plugins/ckeditor/ckeditor.js"></script>
<script src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.js"></script>
<script src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
<script src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.extensions.js"></script>
<script src="${pageContext.request.contextPath}/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/chartjs/Chart.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.resize.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.pie.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.categories.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/bootstrap-slider/bootstrap-slider.js"></script>
<script src="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.js"></script>
<script src="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/locales/bootstrap-datetimepicker.zh-CN.js"></script>

<script>

    Vue.component("con_username",con_username);

    var app = new Vue({
        el:"#course_update_app",//el即element，要渲染的页面元素
        data: {
            test:"test",
            sid:"",
            sname:"",

            studentCourse:{
                cid:"",//课程id
                cname:"",//课程名
                sid:"",//选课学生id
                sname:"",//选课学生姓名
                tid:"",
                tname:"",//教课老师姓名
                score:"-1",//分数
            },

        },

        created(){//加载数据
            this.getNameById()
            this.init()
        },

        methods:{

            init(){
                this.studentCourse=JSON.parse('${pageContext.request.getParameter("val")}')
                // console.log(this.studentCourse)
            },
            getNameById(){//加载数据
                axios({
                    url: "${pageContext.request.contextPath}/student/findNameById.do",
                    method: "get",
                    params: {
                        id:"${pageContext.session.getAttribute("SPRING_SECURITY_CONTEXT").authentication.principal.username}",
                        roles:"${pageContext.session.getAttribute("SPRING_SECURITY_CONTEXT").authentication.principal.authorities}",
                    },
                }).then(res => {
                    app.sname = res.data.name;
                }).catch(
                    error => console.log(error)
                );
            },
        },
    });



    $(document).ready(function() {
        // 选择框
        $(".select2").select2();

        // WYSIHTML5编辑器
        $(".textarea").wysihtml5({
            locale: 'zh-CN'
        });
    });


    // 设置激活菜单
    function setSidebarActive(tagUri) {
        var liObj = $("#" + tagUri);
        if (liObj.length > 0) {
            liObj.parent().parent().addClass("active");
            liObj.addClass("active");
        }
    }


    $(document).ready(function() {

        // 激活导航位置
        setSidebarActive("admin-datalist");

        // 列表按钮
        $("#dataList td input[type='checkbox']").iCheck({
            checkboxClass: 'icheckbox_square-blue',
            increaseArea: '20%'
        });
        // 全选操作
        $("#selall").click(function() {
            var clicks = $(this).is(':checked');
            if (!clicks) {
                $("#dataList td input[type='checkbox']").iCheck("uncheck");
            } else {
                $("#dataList td input[type='checkbox']").iCheck("check");
            }
            $(this).data("clicks", !clicks);
        });
    });
</script>
</body>


</html>
