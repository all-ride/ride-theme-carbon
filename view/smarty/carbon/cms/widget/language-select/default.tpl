{* widget: language.select; action: index; translation: widget.language.select *}
{if !$locales|count == 1}
<nav class="nav nav--language {$app.cms.properties->getWidgetProperty('style.container')}" id="widget-{$app.cms.widget}">
    <ul class="locales {$app.cms.properties->getWidgetProperty('style.menu')}">
        {foreach $locales as $code => $data}
            {$locale = $data.locale}
            <li><a href="{$data.url}"{if $code == $app.locale} class="active"{/if}>{$code}</a></li>
        {/foreach}
    </ul>
</nav>
{/if}
