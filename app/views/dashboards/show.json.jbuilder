json.partial! "dashboards/dashboard", dashboard: @dashboard
%script{src: "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js" }
.row
  %h1 Your Dashboard
.dashboard-container
  .row
    .col-sm-6.col-md-3
      %br
      .thumbnail
        %h1{style: "text-align: center;"}
          =@total_points
        %h4{style: "text-align: center;"} Your current point total
    .col-sm-6.col-md-9
      %h1
      %canvas#lineChart
  %br
  %br
  %br
  %hr
  %br
  %br
  .row
    %h1 WVAStrong Group Totals
  .row
    .col-xs-3.col-md-3
    .col-xs-6.col-md-6
      .thumbnail
        %h3
        %canvas#barChart