$.ajaxSettings.traditional = true;
//-----------------------------
$(function () {
    $(".btn_input").click(function () {
        location.href = $(this).data("url");
    });

    $(".btn_page").click(function () {
        var pageNo = $(this).data("page") || $("input[name='currentPage']").val();
        var current = $("input[name='currentPage']").val(pageNo);
        $("#searchForm").submit();
    });
    $("#pageSize").change(function () {
        $("input[name='currentPage']").val(1);
        $("#searchForm").submit();
    });


    $('.date-picker').daterangepicker({
        singleDatePicker: true,
        format: 'YYYY-MM-DD'
    }, function (start, end, label) {
        console.log(start.toISOString(), end.toISOString(), label);
    });


});

$(".btn_delete").click(function () {
    var url = $(this).data("url");
    showDialog("你确定要删除吗？", function () {
        $.get(url, function (data) {
            if (data.success) {
                showDialog("删除成功", function () {
                    window.location.reload();
                })
            }
        }, "json");
    }, true);
});

function showDialog(content, fn, cancel) {
    $.dialog({
        title: "温馨提示",
        icon: "face-smile",
        content: content,
        ok: fn || true,
        cancel: cancel
    })
}
