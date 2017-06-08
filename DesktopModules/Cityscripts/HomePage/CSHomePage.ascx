<%@ Control Language="C#" AutoEventWireup="false" Inherits="Cityscripts.HomePage.CSHomePage" CodeFile="CSHomePage.ascx.cs" %>


<script type="text/javascript">
    jQuery(function ($) {
        $('#tabs-demo').dnnTabs();
    });
</script>
<style>
 .dnnForm .ui-tabs {
    position: relative;
    padding: .2em;
    zoom: 1;
}
    /* position: relative prevents IE scroll bug (element with position: relative inside container with overflow: auto appear as "fixed") */
    .dnnForm .ui-tabs .ui-tabs-nav {
        margin: 0;
        padding: .2em .2em 0;
    }

        .dnnForm .ui-tabs .ui-tabs-nav li,
        ul.dnnAdminTabNav li {
            list-style: none;
            float: left;
            position: relative;
            top: 1px;
            margin: 0 .2em 1px 0;
            border-bottom: 0 !important;
            padding: 0;
            white-space: nowrap;
        }

            .dnnForm .ui-tabs .ui-tabs-nav li a,
            ul.dnnAdminTabNav li a {
                float: left;
                padding: .5em 1em;
                text-decoration: none;
                font-weight: bold;
                color: #fff;
                text-decoration: none;
                display: block;
                margin: 0;
                letter-spacing: -0.03em;
                background: #818181;
                background: -moz-linear-gradient(top, #818181 0%, #656565 100%);
                background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#818181), color-stop(100%,#656565));
                filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#818181', endColorstr='#656565',GradientType=0 );
                -moz-border-radius-topleft: 3px;
                -moz-border-radius-topright: 3px;
                -moz-border-radius-bottomright: 0px;
                -moz-border-radius-bottomleft: 0px;
                border-top-left-radius: 3px;
                border-top-right-radius: 3px;
                border-bottom-right-radius: 0px;
                border-bottom-left-radius: 0px;
                text-shadow: 0px 1px 1px #000;
            }

            .dnnForm .ui-tabs .ui-tabs-nav li.ui-tabs-selected {
                margin-bottom: 0;
                padding-bottom: 1px;
            }

                .dnnForm .ui-tabs .ui-tabs-nav li.ui-tabs-selected a,
                .dnnForm .ui-tabs .ui-tabs-nav li.ui-state-disabled a,
                .dnnForm .ui-tabs .ui-tabs-nav li.ui-state-processing a {
                    cursor: text;
                }

            .dnnForm .ui-tabs .ui-tabs-nav li a,
            .dnnForm .ui-tabs.ui-tabs-collapsible .ui-tabs-nav li.ui-tabs-selected a {
                cursor: pointer;
            }
    /* first selector in group seems obsolete, but required to overcome bug in Opera applying cursor: text overall if defined elsewhere... */
    .dnnForm .ui-tabs .ui-tabs-panel {
        display: block;
        border-width: 0;
        padding: 1em 1.4em;
        background: none;
    }

.dnnForm .ui-tabs-panel {
    position: relative;
}

.dnnForm .ui-tabs-hide {
    display: none !important;
}

</style>
<div class="dnnForm dnnEdit dnnClear" id="dnnEdit">
    <fieldset>
        <div class="dnnFormItem">
            <asp:Label ID="lblMessageBox" runat="server" Text=""></asp:Label><br />
            <div class="dnnForm" id="tabs-demo">
                <ul class="dnnAdminTabNav">
                    <li><a href="#Transcriptions">Transcriptions</a></li>
                    <li><a href="#Translations">Translations</a></li>
                    <li><a href="#Subtitling">Subtitling</a></li>
                    <li><a href="#PostProductionScripts">Post Production Scripts</a></li>
                    <li><a href="#VideoLogging">Video Logging</a></li>
                </ul>
                <div id="Transcriptions" class="dnnClear">
                    <img alt="Transcriptions" class="dnnLeft" src="../../../Portals/0/Images/HP/HP5.png" />
                    <div class="dnnRight" style="width: 80%; margin-left: 2%">
                        <h1>Transcriptions</h1>
                        <p style="font-family: Tahoma, Geneva, sans-serif; font-weight: 500">Transcriptions come with <i>timecoded transcripts as standard</i> and workflows are specifically tailored towards the complexities of tapeless shooting - <b>we know what to do.<b></p>
                    </div>
                </div>
                <div id="Translations" class="dnnClear">
                    <img src="../../../Portals/0/Images/HP/HP2.png" alt="Translations" class="dnnLeft" />
                    <div class="dnnRight" style="width: 80%; margin-left: 2%">
                        <h1>Translations</h1>
                        <p style="font-family: Tahoma, Geneva, sans-serif; font-weight: 500">We do translations for <b>a number of languages</b> at very competative prices so please contact us with your translator needs for <i>accurate results</i>.</p>
                    </div>
                </div>
                <div id="Subtitling" class="dnnClear">
                    <img src="../../../Portals/0/Images/HP/HP3.png" alt="Subtitling" class="dnnLeft" />
                    <div class="dnnRight" style="width: 80%; margin-left: 2%">
                        <h1>Subtitling</h1>
                        <p style="font-family: Tahoma, Geneva, sans-serif; font-weight: 500">Whether you need subtitles for a feature film, TV, documentary or a DVD, we have the <b>experience</b> and <b>know-how</b> to easily fulfill your requirements.</p>
                    </div>
                </div>
                <div id="PostProductionScripts" class="dnnClear">
                    <img src="../../../Portals/0/Images/HP/HP4.png" alt="PostProductionScripts" class="dnnLeft" />
                    <div class="dnnRight" style="width: 80%; margin-left: 2%">
                        <h1>Post Production Scripts</h1>
                        <p style="font-family: Tahoma, Geneva, sans-serif; font-weight: 500">Our Post Production scripts help fulfill a broadcaster's complete specification for finished programs in order to <i>fulfil deliverable requirements</i>.</p>
                    </div>
                </div>
                <div id="VideoLogging" class="dnnClear">
                    <img src="../../../Portals/0/Images/HP/HP1.png" alt="VideoLogging" class="dnnLeft" />
                    <div class="dnnRight" style="width: 80%; margin-left: 2%">
                        <h1>Video Logging</h1>
                        <p style="font-family: Tahoma, Geneva, sans-serif; font-weight: 500"><b>Complete solutions</b> including shot descriptions, rough dialogue, image thumbnails, delivered in multiple formats. <i>Speak to us for expert solutions</i>.</p>
                    </div>
                </div>
            </div>
        </div>
    </fieldset>
</div>




