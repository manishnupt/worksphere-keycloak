<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true displayRequiredFields=false>
<!DOCTYPE html>
<html class="${properties.kcHtmlClass!}"<#if realm.internationalizationEnabled> lang="${locale.currentLanguageTag}"</#if>>

<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="robots" content="noindex, nofollow">

    <#if properties.meta?has_content>
        <#list properties.meta?split(' ') as meta>
            <meta name="${meta?split('==')[0]}" content="${meta?split('==')[1]}"/>
        </#list>
    </#if>
    <title>${msg("loginTitle",(realm.displayName!''))}</title>
    <link rel="icon" href="${url.resourcesPath}/img/favicon.ico" />
    <#if properties.stylesCommon?has_content>
        <#list properties.stylesCommon?split(' ') as style>
            <link href="${url.resourcesCommonPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>
    <#if properties.styles?has_content>
        <#list properties.styles?split(' ') as style>
            <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>
    <#if properties.scripts?has_content>
        <#list properties.scripts?split(' ') as script>
            <script src="${url.resourcesPath}/${script}" type="text/javascript"></script>
        </#list>
    </#if>
    <#if scripts??>
        <#list scripts as script>
            <script src="${script}" type="text/javascript"></script>
        </#list>
    </#if>
</head>

<body class="${properties.kcBodyClass!}">
<div class="${properties.kcLoginClass!}">
    <#-- WorkSphere: branded left panel (replaces the default realm-name header) -->
    <aside id="kc-header" class="${properties.kcHeaderClass!} ws-panel">
        <#-- Decorative light waves -->
        <svg class="ws-waves" viewBox="0 0 1000 1000" preserveAspectRatio="none" aria-hidden="true">
            <defs>
                <linearGradient id="wsWave" x1="0" x2="1" y1="0" y2="0">
                    <stop offset="0" stop-color="#3b5bff" stop-opacity="0"/>
                    <stop offset=".45" stop-color="#4f6bff"/>
                    <stop offset="1" stop-color="#8a5cff"/>
                </linearGradient>
                <linearGradient id="wsRidge" x1="0" x2="0" y1="1" y2="0">
                    <stop offset="0" stop-color="#4f6bff" stop-opacity="0"/>
                    <stop offset=".6" stop-color="#6d7dff"/>
                    <stop offset="1" stop-color="#b08cff"/>
                </linearGradient>
            </defs>
            <g class="ws-waves__low" stroke="url(#wsWave)">
                <#list 0..15 as i>
                    <path d="M-40 ${(820 + i * 9)?c} C 220 ${(700 + i * 12)?c}, 560 ${(1000 - i * 7)?c}, 1040 ${(780 + i * 10)?c}"/>
                </#list>
            </g>
            <g class="ws-waves__ridge" stroke="url(#wsRidge)">
                <#list 0..9 as i>
                    <path d="M ${(420 + i * 14)?c} 1000 C ${(560 + i * 10)?c} 640, ${(700 + i * 8)?c} ${(80 + i * 12)?c}, ${(860 + i * 6)?c} ${(20 + i * 10)?c} S ${(980 - i * 4)?c} ${(260 + i * 14)?c}, 1060 ${(120 + i * 16)?c}"/>
                </#list>
            </g>
        </svg>

        <div id="kc-header-wrapper" class="ws-brand">
            <span class="ws-brand__mark" aria-hidden="true">W</span>
            <span class="ws-brand__name">WorkSphere</span>
        </div>

        <div class="ws-copy">
            <p class="ws-eyebrow">Your workforce platform</p>
            <h2 class="ws-title">Your people.<br>One <span>workspace.</span></h2>
            <p class="ws-lead">Unify people, policies, and productivity in a single, secure platform.</p>

            <ul class="ws-features">
                <li>
                    <span class="ws-features__icon"><svg viewBox="0 0 24 24"><circle cx="9" cy="8" r="3.2"/><path d="M3.5 19c.6-3 2.8-4.6 5.5-4.6s4.9 1.6 5.5 4.6M16 5.2a3 3 0 0 1 0 5.6M17.5 14.6c1.6.5 2.7 2 3 4.4"/></svg></span>
                    <div><b>People Management</b><span>Organize and grow your team</span></div>
                </li>
                <li>
                    <span class="ws-features__icon"><svg viewBox="0 0 24 24"><rect x="3.5" y="5" width="17" height="15" rx="2.5"/><path d="M3.5 9.5h17M8 3v4M16 3v4M8 13h2M14 13h2M8 16.5h2"/></svg></span>
                    <div><b>Attendance &amp; Leave</b><span>Flexible policies, simplified tracking</span></div>
                </li>
                <li>
                    <span class="ws-features__icon"><svg viewBox="0 0 24 24"><circle cx="6" cy="6" r="2.5"/><circle cx="18" cy="6" r="2.5"/><circle cx="12" cy="18" r="2.5"/><path d="M8.5 6h7M7.3 8.2l3.4 7.5M16.7 8.2l-3.4 7.5"/></svg></span>
                    <div><b>Workflows &amp; Approvals</b><span>Faster decisions, higher productivity</span></div>
                </li>
                <li>
                    <span class="ws-features__icon"><svg viewBox="0 0 24 24"><path d="M4 20h16"/><rect x="5.5" y="11" width="3" height="6.5" rx="1"/><rect x="10.5" y="6" width="3" height="11.5" rx="1"/><rect x="15.5" y="9" width="3" height="8.5" rx="1"/></svg></span>
                    <div><b>Reports &amp; Insights</b><span>Actionable data for better decisions</span></div>
                </li>
            </ul>
        </div>

        <p class="ws-tagline">People <i>&bull;</i> Process <i>&bull;</i> Progress</p>

        <#-- Decorative 3D dashboard preview (HTML/CSS, sample data) -->
        <div class="ws-scene" aria-hidden="true">
            <div class="ws-dash">
                <div class="ws-dash__nav">
                    <span class="ws-dash__logo"></span>
                    <span class="is-active"><svg viewBox="0 0 24 24"><path d="M4 11l8-6.5 8 6.5V19a1.5 1.5 0 0 1-1.5 1.5H15v-5h-6v5H5.5A1.5 1.5 0 0 1 4 19z"/></svg></span>
                    <span><svg viewBox="0 0 24 24"><circle cx="9" cy="8" r="3.2"/><path d="M3.5 19c.6-3 2.8-4.6 5.5-4.6s4.9 1.6 5.5 4.6"/></svg></span>
                    <span><svg viewBox="0 0 24 24"><rect x="3.5" y="5" width="17" height="15" rx="2.5"/><path d="M3.5 9.5h17M8 3v4M16 3v4"/></svg></span>
                    <span><svg viewBox="0 0 24 24"><path d="M4 20h16"/><rect x="5.5" y="11" width="3" height="6.5" rx="1"/><rect x="10.5" y="6" width="3" height="11.5" rx="1"/><rect x="15.5" y="9" width="3" height="8.5" rx="1"/></svg></span>
                </div>
                <div class="ws-dash__body">
                    <div class="ws-dash__hello">
                        <div><b>Hi, Alex &#128075;</b><small>Here&rsquo;s what&rsquo;s happening today</small></div>
                        <span class="ws-dash__more">&middot;&middot;&middot;</span>
                    </div>
                    <div class="ws-dash__stats">
                        <div><i class="ws-c-blue"><svg viewBox="0 0 24 24"><circle cx="9" cy="8" r="3.2"/><path d="M3.5 19c.6-3 2.8-4.6 5.5-4.6s4.9 1.6 5.5 4.6M16 5.2a3 3 0 0 1 0 5.6M17.5 14.6c1.6.5 2.7 2 3 4.4"/></svg></i><b>248</b><small>Employees</small></div>
                        <div><i class="ws-c-teal"><svg viewBox="0 0 24 24"><rect x="3.5" y="5" width="17" height="15" rx="2.5"/><path d="M3.5 9.5h17M8 3v4M16 3v4M8 13h2M14 13h2"/></svg></i><b>18</b><small>On Leave</small></div>
                        <div><i class="ws-c-violet"><svg viewBox="0 0 24 24"><path d="M7 3.5h10M7 20.5h10M8 3.5c0 4.5 8 4.5 8 8.5s-8 4-8 8.5M16 3.5c0 4.5-8 4.5-8 8.5s8 4 8 8.5"/></svg></i><b>12</b><small>Pending Approvals</small></div>
                    </div>
                    <div class="ws-dash__lists">
                        <div class="ws-list">
                            <div class="ws-list__head"><b>Today&rsquo;s Schedule</b><span>View All</span></div>
                            <div class="ws-list__row"><span class="ws-avatar ws-av-1">TS</span><div><b>Team Standup</b><small>10:00 AM - 10:30 AM</small></div></div>
                            <div class="ws-list__row"><span class="ws-avatar ws-av-2">DR</span><div><b>Design Review</b><small>11:30 AM - 12:00 PM</small></div></div>
                            <div class="ws-list__row"><span class="ws-avatar ws-av-3">1:1</span><div><b>1:1 with Manager</b><small>02:00 PM - 02:30 PM</small></div></div>
                        </div>
                        <div class="ws-list ws-list--pop">
                            <div class="ws-list__head"><b>Pending Approvals</b><span>View All</span></div>
                            <div class="ws-list__row"><span class="ws-avatar ws-av-4">PS</span><div><b>Leave Request</b><small>Priya Sharma &middot; 2 days ago</small></div></div>
                            <div class="ws-list__row"><span class="ws-avatar ws-av-5">RM</span><div><b>WFH Request</b><small>Rohit Mehta &middot; 3 days ago</small></div></div>
                            <div class="ws-list__row"><span class="ws-avatar ws-av-6">AK</span><div><b>Regularization</b><small>Aisha Kapoor &middot; 4 days ago</small></div></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="ws-attend">
                <div class="ws-attend__head"><b>Team Attendance</b><span>92% &uarr;</span></div>
                <div class="ws-attend__bars">
                    <#list [86, 62, 50, 44, 78, 55, 40, 88, 52, 70, 38, 66, 48, 60] as h><i style="--h:${h?c}%"></i></#list>
                </div>
            </div>
        </div>
    </aside>

    <#-- Right column: company (realm) card + sign-in card -->
    <div class="ws-auth">
        <div class="ws-tenant">
            <span class="ws-tenant__icon" aria-hidden="true"><svg viewBox="0 0 24 24"><path d="M5 20.5V5a1.5 1.5 0 0 1 1.5-1.5h7A1.5 1.5 0 0 1 15 5v15.5M15 9.5h3a1.5 1.5 0 0 1 1.5 1.5v9.5M3.5 20.5h17M8.5 7.5h3M8.5 11h3M8.5 14.5h3"/></svg></span>
            <div>
                <div class="ws-tenant__name">${(realm.displayName)!(realm.name)!''}</div>
                <div class="ws-tenant__sub">WorkSphere HRMS</div>
            </div>
        </div>
    <div class="${properties.kcFormCardClass!}">
        <header class="${properties.kcFormHeaderClass!}">
            <#if realm.internationalizationEnabled  && locale.supported?size gt 1>
                <div class="${properties.kcLocaleMainClass!}" id="kc-locale">
                    <div id="kc-locale-wrapper" class="${properties.kcLocaleWrapperClass!}">
                        <div id="kc-locale-dropdown" class="${properties.kcLocaleDropDownClass!}">
                            <a href="#" id="kc-current-locale-link">${locale.current}</a>
                            <ul class="${properties.kcLocaleListClass!}">
                                <#list locale.supported as l>
                                    <li class="${properties.kcLocaleListItemClass!}">
                                        <a class="${properties.kcLocaleItemClass!}" href="${l.url}">${l.label}</a>
                                    </li>
                                </#list>
                            </ul>
                        </div>
                    </div>
                </div>
            </#if>
        <#if !(auth?has_content && auth.showUsername() && !auth.showResetCredentials())>
            <#if displayRequiredFields>
                <div class="${properties.kcContentWrapperClass!}">
                    <div class="${properties.kcLabelWrapperClass!} subtitle">
                        <span class="subtitle"><span class="required">*</span> ${msg("requiredFields")}</span>
                    </div>
                    <div class="col-md-10">
                        <h1 id="kc-page-title"><#nested "header"></h1>
                    </div>
                </div>
            <#else>
                <h1 id="kc-page-title"><#nested "header"></h1>
            </#if>
        <#else>
            <#if displayRequiredFields>
                <div class="${properties.kcContentWrapperClass!}">
                    <div class="${properties.kcLabelWrapperClass!} subtitle">
                        <span class="subtitle"><span class="required">*</span> ${msg("requiredFields")}</span>
                    </div>
                    <div class="col-md-10">
                        <#nested "show-username">
                        <div id="kc-username" class="${properties.kcFormGroupClass!}">
                            <label id="kc-attempted-username">${auth.attemptedUsername}</label>
                            <a id="reset-login" href="${url.loginRestartFlowUrl}" aria-label="${msg("restartLoginTooltip")}">
                                <div class="kc-login-tooltip">
                                    <i class="${properties.kcResetFlowIcon!}"></i>
                                    <span class="kc-tooltip-text">${msg("restartLoginTooltip")}</span>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            <#else>
                <#nested "show-username">
                <div id="kc-username" class="${properties.kcFormGroupClass!}">
                    <label id="kc-attempted-username">${auth.attemptedUsername}</label>
                    <a id="reset-login" href="${url.loginRestartFlowUrl}" aria-label="${msg("restartLoginTooltip")}">
                        <div class="kc-login-tooltip">
                            <i class="${properties.kcResetFlowIcon!}"></i>
                            <span class="kc-tooltip-text">${msg("restartLoginTooltip")}</span>
                        </div>
                    </a>
                </div>
            </#if>
        </#if>
      </header>
      <div id="kc-content">
        <div id="kc-content-wrapper">

          <#-- App-initiated actions should not see warning messages about the need to complete the action -->
          <#-- during login.                                                                               -->
          <#if displayMessage && message?has_content && (message.type != 'warning' || !isAppInitiatedAction??)>
              <div class="alert-${message.type} ${properties.kcAlertClass!} pf-m-<#if message.type = 'error'>danger<#else>${message.type}</#if>">
                  <div class="pf-c-alert__icon">
                      <#if message.type = 'success'><span class="${properties.kcFeedbackSuccessIcon!}"></span></#if>
                      <#if message.type = 'warning'><span class="${properties.kcFeedbackWarningIcon!}"></span></#if>
                      <#if message.type = 'error'><span class="${properties.kcFeedbackErrorIcon!}"></span></#if>
                      <#if message.type = 'info'><span class="${properties.kcFeedbackInfoIcon!}"></span></#if>
                  </div>
                      <span class="${properties.kcAlertTitleClass!}">${kcSanitize(message.summary)?no_esc}</span>
              </div>
          </#if>

          <#nested "form">

          <#if auth?has_content && auth.showTryAnotherWayLink()>
              <form id="kc-select-try-another-way-form" action="${url.loginAction}" method="post">
                  <div class="${properties.kcFormGroupClass!}">
                      <input type="hidden" name="tryAnotherWay" value="on"/>
                      <a href="#" id="try-another-way"
                         onclick="document.forms['kc-select-try-another-way-form'].submit();return false;">${msg("doTryAnotherWay")}</a>
                  </div>
              </form>
          </#if>

          <#nested "socialProviders">

          <#if displayInfo>
              <div id="kc-info" class="${properties.kcSignUpClass!}">
                  <div id="kc-info-wrapper" class="${properties.kcInfoAreaWrapperClass!}">
                      <#nested "info">
                  </div>
              </div>
          </#if>
        </div>
      </div>

      <div class="ws-card-foot">Protected by WorkSphere Authentication</div>
    </div>
    </div><#-- /ws-auth -->
  </div>
</body>
</html>
</#macro>
