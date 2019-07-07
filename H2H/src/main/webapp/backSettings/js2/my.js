$(function(){

	starChange();
	
});
function starChange(){
	for (var i=1; i<=5; i++) {
		//为每个星星 绑定鼠标移入 移出 事件
		$(".star"+ i).hover(
			//鼠标移入
			function(){
				var index = $(this).attr("class").substr(4,1);
				for (var i= index; i>0; i--) {
					$(".star"+ i).addClass("c" + index);
				}
				//改变评价样式 及 内容
				switch(index){
					case "1":
						$(".remark").addClass("c1").text("差评");
						break;
					case "2":
						$(".remark").addClass("c2").text("较差");
						break;
					case "3":
						$(".remark").addClass("c3").text("一般");
						break;
					case "4":
						$(".remark").addClass("c4").text("较好");
						break;
					case "5":
						$(".remark").addClass("c5").text("优秀");
						break;
				}
			},
			//鼠标移出
			function(){
				var index = $(this).attr("class").substr(4,1);
				for (var i= index; i>0; i--) {
					//恢复本身及之前的星星的颜色
					$(".star"+ i).removeClass("c" + index);
				}
				//回复 评价
				$(".remark").removeClass("c" + index).text("您的满意度是？");
			}
		);
		
		//为每个星星 绑定点击事件
		$(".star"+ i).bind("click", function(){
			var index = $(this).attr("class").substr(4,1);
			//点击之后 解绑本身及之前星星的 所有事件
			for(var i=1; i<=index; i++){
				$(".star"+ i).unbind();
			}
			//将后面的隐藏
			while(++index <= 5){
				$(".star"+ index).css("display","none");
			}
		});
	}
}
