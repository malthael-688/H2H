/**
 * Created by Administrator on 2018/3/12.
 */
$(function() {
    $.fn.raty.defaults.path = 'img/';
    $('#score-demo').raty({
        score:5,
        click:function(score){
            $("#major").val(score);
        }
    });
    $('#score1-demo').raty({
        score:5,
        click:function(score){
            $("#service").val(score);
        }
    });
    $('#score2-demo').raty({
        score:5,
        click:function(score){
            $("#fast").val(score);
        }
    });
});
