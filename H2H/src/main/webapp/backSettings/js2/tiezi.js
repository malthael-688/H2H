/**
 * Created by Administrator on 2018/3/7.
 */
$(".tzCollect_left").click(function(){
    $(this).addClass("on");
});
$(".pendDetail_btn li:nth-child(1)").click(function(){
    $(this).addClass("on");
});
$(".replayBtn").click(function(){
    $(".pendDetail_action").hide();
   $(this).parent().parent().next(".pendDetail_action").show();
});
$(".pendDetail_action button:last-of-type").click(function(){
    $(".pendDetail_action").hide();
});