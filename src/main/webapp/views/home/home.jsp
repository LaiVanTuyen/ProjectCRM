<%@include file="/common/taglib.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>HomePage</title>
</head>
<body>
<!-- Header Layout Content -->
<div class="container page__heading-container">
  <div class="page__heading">
    <div class="d-flex align-items-center">
      <div>
        <nav aria-label="breadcrumb">
          <ol class="breadcrumb mb-0">
            <li class="breadcrumb-item"><a href='<c:url value="${UrlConst.HOMEPAGE}"></c:url>'>Home</a></li>
            <li class="breadcrumb-item active" aria-current="page">
              Homepage</li>
          </ol>
        </nav>
        <h1 class="m-0">Homepage</h1>
      </div>
      <div class="ml-auto">
        <a href="" class="btn btn-light"><i
                class="material-icons icon-16pt text-muted mr-1">settings</i>
          Settings</a>
      </div>
    </div>
  </div>
</div>

<div class="container page__container">
  <div class="row card-group-row">
    <div class="col-lg-3 col-md-4 card-group-row__col">
      <div class="card card-group-row__card card-shadow">
        <div class="p-2 d-flex flex-row align-items-center">
          <div class="avatar avatar-xs mr-2">
									<span
                                            class="avatar-title rounded-circle text-center bg-primary">
										<i class="material-icons text-white icon-18pt"> business </i>
									</span>
          </div>
          <a href="#" class="text-dark"> <strong>Companies</strong>
          </a>
        </div>
      </div>
    </div>
    <div class="col-lg-3 col-md-4 card-group-row__col">
    </div>
  </div>
  <div class="card">
    <div
            class="card-header card-header-large bg-white d-flex align-items-center">
      <h4 class="card-header__title flex mb-0">Chart Example</h4>
      <div class="d-flex align-items-center">
        <label for="chart-switch-toggle" class="mb-0">Show
          affiliate:</label>
        <div class="custom-control custom-checkbox-toggle ml-2">
          <input checked="" aria-checked="true" type="checkbox"
                 id="chart-switch-toggle" class="custom-control-input"
                 role="switch" data-toggle="chart"
                 data-target="#ordersChartSwitch"
                 data-add='{"data":{"datasets":[{"data":[15,10,20,12,7,0,8,16,18,16,10,22],"backgroundColor":"#4EB4A5","label":"Affiliate","barPercentage":"0.5","barThickness":"20"}]}}' />
          <label class="custom-control-label" for="chart-switch-toggle"><span
                  class="sr-only">Show affiliate</span></label>
        </div>
      </div>
    </div>
    <div class="card-body">
      <div class="chart">
        <canvas id="ordersChartSwitch" class="chart-canvas"></canvas>
      </div>
    </div>
  </div>

  <!-- Xep hang -->
  <div class="row">
    <div class="col-md-6">
      <div class="card">
        <div class="card-header card-header-large bg-white">
          <h4 class="card-header__title">Top Companies</h4>
        </div>

        <table class="table table-striped border-bottom mb-0">
          <tr>
            <td style="width: 40px">1.</td>
            <td style="width: 200px">
              <div>
                <a href="#" class="text-15pt d-flex align-items-center">
                  <i class="material-icons icon-16pt mr-1">business</i> <strong>Moon
                  Ltd</strong>
                </a>
              </div> <small class="text-muted">(2 invoices)</small>
            </td>
            <td class="text-right" style="width: 100px">3% <i
                    class="material-icons icon-16pt text-success">arrow_upward</i>
            </td>
            <td class="text-right" style="width: 60px">
              <div class="badge badge-soft-success">PAID</div>
            </td>
            <td class="text-right" style="width: 80px">$32,124</td>
          </tr>

          <tr>
            <td style="width: 40px">3.</td>
            <td style="width: 200px">
              <div>
                <a href="#" class="text-15pt d-flex align-items-center">
                  <i class="material-icons icon-16pt mr-1">business</i> <strong>Visual
                  Design</strong>
                </a>
              </div> <small class="text-muted">(4 invoices)</small>
            </td>
            <td class="text-right" style="width: 100px">12% <i
                    class="material-icons icon-16pt text-success">arrow_upward</i>
            </td>
            <td class="text-right" style="width: 60px">
              <div class="badge badge-soft-danger">DUE</div>
            </td>
            <td class="text-right" style="width: 80px">$2,229</td>
          </tr>
        </table>

        <div class="card-footer text-center border-0">
          <a class="text-muted" href="">View All (391)</a>
        </div>
      </div>
    </div>
    <div class="col-md-6">
      <div class="card">
        <div
                class="card-header card-header-large bg-white d-flex align-items-center">
          <h4 class="card-header__title flex m-0">Recently Acitivies</h4>
          <div data-toggle="flatpickr" data-flatpickr-wrap="true"
               data-flatpickr-static="true" data-flatpickr-mode="range"
               data-flatpickr-alt-format="d/m/Y"
               data-flatpickr-date-format="d/m/Y">
            <a href="javascript:void(0)" class="link-date" data-toggle>13/03/2018
              <span class="text-muted mx-1">to</span> 20/03/2018
            </a> <input class="d-none" type="hidden"
                        value="13/03/2018 to 20/03/2018" data-input />
          </div>
        </div>
        <div class="card-header card-header-tabs-basic nav"
             role="tablist">
          <a href="#activity_all" class="active" data-toggle="tab"
             role="tab" aria-controls="activity_all" aria-selected="true">All</a>
          <a href="#activity_purchases" data-toggle="tab" role="tab"
             aria-controls="activity_purchases" aria-selected="false">Purchases</a>
          <a href="#activity_emails" data-toggle="tab" role="tab"
             aria-controls="activity_emails" aria-selected="false">Emails</a>
          <a href="#activity_quotes" data-toggle="tab" role="tab"
             aria-controls="activity_quotes" aria-selected="false">Quotes</a>
        </div>
        <div class="list-group tab-content list-group-flush">
          <div class="tab-pane active show fade" id="activity_all">
            <div
                    class="list-group-item list-group-item-action d-flex align-items-center">
              <div class="avatar avatar-xs mr-3">
											<span class="avatar-title rounded-circle bg-purple"> <i
                                                    class="material-icons">monetization_on</i>
											</span>
              </div>

              <div class="flex">
                <div class="d-flex align-items-middle">
                  <div class="avatar avatar-xxs mr-1">
                    <img
                            src="assets/images/256_rsz_1andy-lee-642320-unsplash.jpg"
                            alt="Avatar" class="avatar-img rounded-circle" />
                  </div>

                  <strong class="text-15pt mr-1">Jenell D. Matney</strong>
                </div>
                <small class="text-muted">4 days ago</small>
              </div>
              <div>$573</div>

              <i class="material-icons icon-muted ml-3">arrow_forward</i>
            </div>

            <div
                    class="list-group-item list-group-item-action d-flex align-items-center">
              <div class="avatar avatar-xs mr-3">
											<span class="avatar-title rounded-circle bg-teal"> <i
                                                    class="material-icons">email</i>
											</span>
              </div>

              <div class="flex">
                <div class="d-flex align-items-middle">
                  <div class="avatar avatar-xxs mr-1">
                    <img
                            src="assets/images/256_daniel-gaffey-1060698-unsplash.jpg"
                            alt="Avatar" class="avatar-img rounded-circle" />
                  </div>

                  <strong class="text-15pt mr-1">Sherri J. Cardenas</strong>
                </div>
                <small>Improve spacings on Projects page</small>
              </div>
              <small class="text-muted">3 days ago</small> <i
                    class="material-icons icon-muted ml-3">arrow_forward</i>
            </div>

            <div
                    class="list-group-item list-group-item-action d-flex align-items-center bg-light">
              <div class="avatar avatar-xs mr-3">
											<span class="avatar-title rounded-circle"> <i
                                                    class="material-icons">monetization_on</i>
											</span>
              </div>

              <div class="flex">
                <div class="d-flex align-items-middle">
                  <div class="avatar avatar-xxs mr-1">
                    <img
                            src="/assets/images/256_jeremy-banks-798787-unsplash.jpg"
                            alt="Avatar" class="avatar-img rounded-circle" />
                  </div>

                  <strong class="text-15pt mr-1">Joseph S. Ferland</strong>
                </div>
                <small class="text-muted">2 days ago</small>
              </div>
              <div>$244</div>

              <i class="material-icons icon-muted ml-3">arrow_forward</i>
            </div>
            <div class="card-footer text-center border-0">
              <a class="text-muted" href="">View All (54)</a>
            </div>
          </div>
          <div class="tab-pane" id="activity_purchases"></div>
          <div class="tab-pane" id="activity_emails"></div>
          <div class="tab-pane" id="activity_quotes"></div>
        </div>
      </div>
    </div>
  </div>
</div>
</div>
<!-- // END Header Layout Content -->

</body>
</html>
