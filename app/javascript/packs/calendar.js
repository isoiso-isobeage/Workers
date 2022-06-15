import { Calendar } from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';
import timeGridPlugin from '@fullcalendar/timegrid';
import listPlugin from '@fullcalendar/list';
import interactionPlugin from '@fullcalendar/interaction';

$(document).ready(function() {
  const calendarEl = document.getElementById('calendar');
  console.log(calendarEl)
      console.log("aaa");

  if (calendarEl != null) {
    console.log("bbb");
    const calendar = new Calendar(calendarEl, {
    plugins: [ dayGridPlugin, timeGridPlugin, listPlugin, interactionPlugin ],

    // フルカレンダー設定オプション
    initialView: 'dayGridMonth',
    headerToolbar: {
      left: 'prev next today',
      center: 'title',
      right: 'dayGridMonth,timeGridWeek,listWeek'
    },


    locale: 'ja',
    timeZone: 'Asia/Tokyo',
    firstDay: 1,
    expandRows: true,
    stickyHeaderDates: true,
    buttonText: {
      today: '今日',
      month: '月',
      week: '週',
      list: '予定'
    },
    allDayText: '終日',
    height: "auto",
    events: 'works.json',
    editable: true,
    aspectRatio: 2,


    // dateClick: function(info){

    //     //クリックした日付の情報を取得
    //     const year  = info.date.getFullYear();
    //     const month = (info.date.getMonth() + 1);
    //     const day   = info.date.getDate();

    //     const site_id = info.event.site_id

    //     $.ajax({
    //         type: 'GET',
    //         url:  '/sites/' + site_id + '/works/new'
    //         // 引数resは受け取ったhtmlが入っている
    //     }).done(function (res) {
    //             // 成功処理
    //             // 受け取ったhtmlを
    //         $('.modal-body').html(res);

    //         //フォームの年、月、日を自動入力
    //         $('#work_start_1i').val(year);
    //         $('#work_start_2i').val(month);
    //         $('#work_start_3i').val(day);

    //         $('#work_end_1i').val(year);
    //         $('#work_end_2i').val(month);
    //         $('#work_end_3i').val(day);

    //         $('#modal').fadeIn();

    //     }).fail(function (result){

    //     // 失敗処理
    //     alert("データを取得できません");
    //     });
    // },


    //表示された予定をクリックしたときのイベント
    eventClick: function(info){

      // 選択したイベントのIDを取得
      const id = info.event.id;
      const site_id = info.event.site_id

      $.ajax({
        type: 'GET', // HTTPメソッド
        url: '/sites/' + site_id + '/works/' + id,
        data: { id: id,}, // urlに送りたいデータ
        dataType: 'json'  //データの型, textなどもある
      });
    },

    eventDrop: function(info){
      const id = info.event.id;
      const site_id = info.event.site_id;
      const start = info.event.start;
      const end = info.event.end;

      // authenticity_token.valueを取得するために定義
      const form = document.forms.event;

      console.log(id);
      console.log(start);


      $.ajax({
        type: 'patch',
        url: '/sites/' + site_id + '/works/' + id,
        data: { id: id, start_date: start, end_date: end, authenticity_token: form.authenticity_token.value },
        dataType: 'json'
      });
      calendar.render();
    },

    });

  calendar.render();
  }
  });

  