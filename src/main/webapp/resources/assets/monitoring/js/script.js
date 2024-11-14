//dataTables 한글화
let lang_kor = {
    "decimal" : "",
    "emptyTable" : "데이터가 없습니다.",
    "info" : "_START_ - _END_ (총 _TOTAL_ 건)",
    "infoEmpty" : "0건",
    "infoFiltered" : "(전체 _MAX_ 건 중 검색결과)",
    "infoPostFix" : "",
    "thousands" : ",",
    "lengthMenu" : "_MENU_ 개씩 보기",
    "loadingRecords" : "로딩중...",
    "processing" : "처리중...",
    "search" : "검색 : ",
    "zeroRecords" : "검색된 데이터가 없습니다.",
    "paginate" : {
        "first" : "첫 페이지",
        "last" : "마지막 페이지",
        "next" : "다음",
        "previous" : "이전"
    },
    "aria" : {
        "sortAscending" : " :  오름차순 정렬",
        "sortDescending" : " :  내림차순 정렬"
    }
};

// toastr 자동 꺼짐 시간
toastr.options.timeOut = 2000;

Chart.register(ChartDataLabels); // chart js datalabel;

//콤마(,) 생성
function addCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

// 숫자 천단위 표기
function numberFormat(node, returnType) {
    node.value = node.value.replace(/[^0-9\.]/g,'');

    if(node.value.split('.').length > 2) { // .이 두개 이상 있을 경우
        node.value = $(node).data('temp');
    } else {
        if(node.value.length != 1) { // 첫번째 입력이 아닐 경우
            if(node.value.split('.')[0].length != 1) { // 0.몇이 아닐 경우
                if(node.value.split('.')[0].slice(0,1) == '0') {
                    node.value = node.value.substring(1)
                }
            }
        }
    }
    if(node.value.slice(0, 1) == '.')  { // 제일 앞 자리가 .일경우
        node.value = "0"+node.value;
    }

    if(node.value.split('.').length == 2) { // float타입일 경우
        node.value = node.value.split('.')[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '.' + node.value.split('.')[1];
    } else {
        node.value = node.value.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    }

    if(returnType == 'int') { // int타입으로 리턴할 경우
        node.value = node.value.split('.')[0];
    } else if(returnType == 'float') { // float타입으로 리턴할 경우
        node.value = node.value;
    }

    if(node.value == '') { // 결과가 ''일 경우 1처리
        node.value = '0'
    }

    $(node).data('temp',node.value.replace(/\B(?=(\d{3})+(?!\d))/g, ","));
}