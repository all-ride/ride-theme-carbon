{* widget: text; action: index; translation: template.text.clickable.panel *}

{include 'cms/helper/text'}

{$tmpCTAs = $callToActions}
{$firstCallToAction = $tmpCTAs|@array_shift}

{if $callToActions}
    <a href="{$firstCallToAction->getUrl()}"  class="text block text--clickable block--panel {if $subtitle}text--has-subtile{/if} {$app.cms.properties->getWidgetProperty('style.container')}" id="widget-{$app.cms.widget}">
        {call renderTextSimple callToActionsType='span'}
    </a>
{else}
    <div class="text block block--panel {if $subtitle}text--has-subtile{/if} {$app.cms.properties->getWidgetProperty('style.container')}" id="widget-{$app.cms.widget}">
        {call renderTextSimple}
    </div>
{/if}
