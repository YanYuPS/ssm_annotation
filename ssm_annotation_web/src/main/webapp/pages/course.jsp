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

    <title>选课信息</title>
    <meta name="description" content="选课信息">
    <meta name="keywords" content="选课信息">

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
<div id="course_app">

    <div class="wrapper">

        <jsp:include page="header.jsp"></jsp:include>
        <jsp:include page="aside.jsp"></jsp:include>


        <div class="content-wrapper">

            <!-- 内容头部 -->
            <section class="content-header">
                <h1>
                    数据管理
                    <small>数据列表</small>
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
                        <h3 class="box-title">选课成绩列表</h3>
                    </div>

                    <div class="box-body">

                        <!-- 数据表格 -->
                        <div class="table-box" style="overflow-x: auto;" >

                            <!--工具栏-->
                            <div class="pull-left">
                                <div class="form-group form-inline">
                                    <div class="btn-group">
                                        <security:authorize access="hasAnyRole('ROLE_ADMIN')">
                                            <button type="button" class="btn btn-default" title="新建"><i class="fa fa-file-o"></i>
                                                <a href="${pageContext.request.contextPath}/pages/course_insert.jsp">新建</a>
                                            </button>
                                            <button type="button" class="btn btn-default" title="删除" @click="deleteList()">
                                                <i class="fa fa-trash-o"></i> 删除
                                            </button>
                                        </security:authorize>

                                    </div>
                                </div>
                            </div>

                            <div class="form-inline pull-right">
                                <div class="form-group">
                                    <label for="cname">课程名：</label>
                                    <input type="text" class="form-control" id="cname" placeholder="" v-model="studentCourse.cname">
                                </div>
                                <security:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_TEACHER')">
                                    <div class="form-group">
                                        <label for="sname">学生姓名：</label>
                                        <input type="text" class="form-control" id="sname" placeholder="" v-model="studentCourse.sname">
                                    </div>
                                </security:authorize>
                                <security:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_STUDENT')">
                                    <div class="form-group">
                                        <label for="tname">老师姓名：</label>
                                        <input type="text" class="form-control" id="tname" placeholder="" v-model="studentCourse.tname">
                                    </div>
                                </security:authorize>
                                <button type="button" class="btn btn-default" title="搜索" @click="search()">搜索</button>
                            </div>
                            <!--工具栏/-->

                            <!--数据列表-->
                            <table id="dataList" class="table table-bordered table-striped table-hover dataTable">
                                <thead>
                                <tr v-if="index==0" v-for="(one,index) in list" :key="index">
                                    <th class="" style="padding-right:0px;">
                                        <input id="selall" type="checkbox" class="icheckbox_square-blue">
                                    </th>
                                    <th v-for="(value,key,index) in one">{{key}}</th>
                                    <%--<th class="sorting_asc">Id</th>--%>
                                    <security:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_TEACHER')">
                                        <th class="text-center">操作</th>
                                    </security:authorize>
                                </tr>
                                </thead>

                                <tbody>
                                <tr v-for="(one,index) in list" :key="index">
                                    <%--@change="deleteChoose()"--%>
                                    <td><input name="ids" type="checkbox" v-model="deleteCheck" :value="one"></td>
                                    <td v-for="(value,key) in one">{{value}}</td>
                                    <%--<td>{{product.id}}</td>--%>
                                    <security:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_TEACHER')"><td class="text-center">
                                        <button type="button" class="btn btn-xs">
                                            <a :href="courseUpdate(one)">修改</a>
                                        </button>
                                    </td></security:authorize>
                                </tr>
                                </tbody>
                            </table>
                            <!--数据列表/-->

                        </div>
                        <!-- 数据表格 /-->

                    </div>
                    <!-- /.box-body -->


                    <!-- .box-footer-->
                    <div class="box-footer">
                        <div class="pull-left">
                            <div class="form-group form-inline">
                                总共 {{page.totlePage}} 页，共 {{page.totle}} 条数据。 每页
                                <select class="form-control" v-model="page.pageSize" @change="getCourseList()">
                                    <option v-for="size in page.pageSizeArray">{{size}}</option>
                                </select> 条
                            </div>
                        </div>

                        <div class="box-tools pull-right">
                            <ul class="pagination">
                                <li v-if="page.currentPage==1" ><a style="pointer-events: none;" aria-label="Previous">首页</a></li>
                                <li v-else @click="startPage()"><a aria-label="Previous" >首页</a></li>

                                <li v-if="page.currentPage==1"><a style="pointer-events: none;">上一页</a></li>
                                <li v-else @click="prePage()"><a >上一页</a></li>

                                <li v-for="index of page.totlePage" @click="pointPage(index)">
                                    <a v-if="page.currentPage==index" style="color: blue;" >{{index}}</a>
                                    <a v-else>{{index}}</a>
                                </li>

                                <li v-if="page.currentPage==page.totlePage"><a style="pointer-events: none;">下一页</a></li>
                                <li v-else @click="nextPage()"><a >下一页</a></li>

                                <li v-if="page.currentPage==page.totlePage"><a style="pointer-events: none;" aria-label="Next">尾页</a></li>
                                <li v-else @click="endPage()"><a aria-label="Next" >尾页</a></li>
                            </ul>
                        </div>

                    </div>
                    <!-- /.box-footer-->



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
        el:"#course_app",//el即element，要渲染的页面元素
        data: {
            sid:"",
            sname:"",

            message:"",
            list:[],
            page:{
                totle:0,
                totlePage:1,
                pageSize:3,
                currentPage:1,
                pageSizeArray:[3,5,10,20],
            },
            studentCourse:{
                cid:"",//课程id
                cname:"",//课程名
                sid:"",//选课学生id
                sname:"",//选课学生姓名
                tid:"",
                tname:"",//教课老师姓名
                score:"-1",//分数
            },
            studentCourseList:[],
            deleteCheck:[],

        },

        created(){//加载数据
            this.getNameById()

            this.getCourseList()
        },

        methods:{
            deleteList(){
                this.studentCourseList=this.deleteCheck

                axios({
                    url: "${pageContext.request.contextPath}/student/deleteStuCou.do",
                    method: "post",
                    data: JSON.stringify(this.studentCourseList),
                    headers: {
                        'Content-Type': 'application/json'
                    },
                }).then(res => {
                    // app.message = res.data;
                    app.studentCourseList=[]
                    deleteCheck=[]

                    app.page.currentPage=1
                    app.getCourseList()
                }).catch(
                    error => console.log(error)
                );
            },
            deleteChoose(){
                console.log(this.deleteCheck)
            },

            courseUpdate(val){
                return "${pageContext.request.contextPath}/pages/course_update.jsp?val="+JSON.stringify(val)
            },

            changePage(){
                let n=Math.floor(this.page.totle/this.page.pageSize)
                this.page.totlePage=this.page.totle%this.page.pageSize==0 ? n : n+1;
            },
            startPage(){
                this.page.currentPage=1
                this.getCourseList()
            },
            endPage(){
                this.page.currentPage=this.page.totlePage
                this.getCourseList()
            },
            prePage(){
                --this.page.currentPage
                this.getCourseList()
            },
            nextPage(){
                ++this.page.currentPage
                this.getCourseList()
            },
            pointPage(index){
                this.page.currentPage=index
                this.getCourseList()
            },
            search(){
                this.page.currentPage==1
                this.getCourseList()
            },

            getCourseList(){//加载数据
                // console.log(message);
                axios({
                    url: "${pageContext.request.contextPath}/student/findAllStuCou.do",
                    method: "get",
                    params: {
                        roles:"${pageContext.session.getAttribute("SPRING_SECURITY_CONTEXT").authentication.principal.authorities}",//确定展示的全部内容（学生--自己的，老师-自己学生的，管理员-全部学生的）
                        id:"${pageContext.session.getAttribute("SPRING_SECURITY_CONTEXT").authentication.principal.username}",

                        // studentCourse:{//用于查找
                            cid:this.studentCourse.cid,//课程id
                            cname:this.studentCourse.cname,//课程名
                            sid:this.studentCourse.sid,//选课学生id
                            sname:this.studentCourse.sname,//选课学生姓名
                            tid:this.studentCourse.tid,
                            tname:this.studentCourse.tname,//教课老师姓名
                            score:this.studentCourse.score,//分数
                        // },

                        // pageResult:{
                            pageNum:this.page.currentPage,
                            pageSize:this.page.pageSize,
                            totle:0, //必有
                        // }
                    },
                }).then(res => {
                    app.list = res.data.rows;
                    app.page.totle = res.data.totle;
                    app.changePage();
                }).catch(
                    error => console.log(error)
                );
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
