<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
</div>	
<script src="js/jquery.min.js"></script>
<script src="js/jquery-migrate-1.3.0.js"></script>
<script src="js/amazeui.min.js"></script>
<script src="js/app.js"></script>
<script src="js/thickbox.js"></script>
<script src="js/iscroll.min.js" type="text/javascript" charset="utf-8"></script>
<script src="js/address.min.js" type="text/javascript" charset="utf-8"></script>
<script src="js/layer/layer.js"></script>
<script src="js/common.js"></script>
<script src="js/ajaxfileupload.js"></script>
<script>
	$(function(){
	
		$("#toPageNum").attr("style", "text-align: left;display: inline-block;border-left:none;border-right:none;border-top:none;border-bottom:1px solid #0e90d2; width: 10%;height: 2.8rem");
		$("my_dws").attr("style","margin-right: 5px;margin-bottom: 5px;line-height: 1.2;padding: 3px 12px;border-radius: 3px;border: 1px solid #ddd;list-style: none;display: inline-block;text-align: left;width: 3.57rem;height: 3rem");
	})
	function toPage(totalPage) {
     var url = $("#pageUrl").val();
     var page = $("#toPageNum").val();

     if (page > totalPage) {
      page = totalPage;

      layer.alert("亲,超出总页数，将跳到最后一页", {
       icon: 1,
       skin: 'layui-layer-lan',
       closeBtn: 0,
       //btn: ['确定','离开'] //按钮
      }, function () {
       if (url.indexOf("?") == -1) {
        url = url + "?page=" + page;
       } else {
        if (url.endsWith("?")) {
         url = url + "page=" + page;
        } else {
         url = url + "&page=" + page;
        }
       }
       window.location.href = url;
      });

     } else if (page < 1 || /[\u4e00-\u9fa5]/.test(page) || /[a-zA-Z_!@#$%^&*￥……~]+/.test(page)) {
      page = 1;

      layer.alert("亲,输入内容有误，将跳到首页", {
       icon: 1,
       skin: 'layui-layer-lan',
       closeBtn: 0,
       //btn: ['确定','离开'] //按钮
      }, function () {
       if (url.indexOf("?") == -1) {
        url = url + "?page=" + page;
       } else {
        if (url.endsWith("?")) {
         url = url + "page=" + page;
        } else {
         url = url + "&page=" + page;
        }
       }
       window.location.href = url;
      });
     } else {

      if (url.indexOf("?") == -1) {
       url = url + "?page=" + page;
      } else {
       if (url.endsWith("?")) {
        url = url + "page=" + page;
       } else {
        url = url + "&page=" + page;
       }
      }
      window.location.href = url;

     }
    }
	function js_search(){
		$("#search_form").submit();
	}
</script>
</body>
</html>