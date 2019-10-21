<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: rainbow
  Date: 2019-08-30
  Time: 23:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>侧边栏</title>
</head>
<body>


<!-- 导航侧栏 -->
<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="../img/user2-160x160.jpg" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
                <con_username :name="sname"></con_username>
                <%--<a href="#"><i class="fa fa-circle text-success"></i> 在线</a>--%>
            </div>
        </div>

        <!-- sidebar menu: : style can be found in sidebar.less -->
        <ul class="sidebar-menu">
            <li class="header">菜单</li>

            <li id="admin-index"><a href="${pageContext.request.contextPath}/pages/index.jsp"><i class="fa fa-dashboard"></i> <span>首页</span></a></li>

            <li class="treeview">
                <a href="#">
                    <i class="fa fa-folder"></i> <span>信息管理</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>

                <ul class="treeview-menu">
                    <li id="course_list">
                        <a href="${pageContext.request.contextPath}/pages/course.jsp">
                            <i class="fa fa-circle-o"></i> 选课信息
                        </a>
                    </li>
                </ul>
            </li>


        </ul>
    </section>
    <!-- /.sidebar -->
</aside>
<!-- 导航侧栏 /-->


</body>
</html>
