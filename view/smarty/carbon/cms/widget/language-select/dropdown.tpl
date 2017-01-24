{* widget: language.select; action: index; translation: template.language.select.dropdown *}

{if $locales|count > 1}
    <div class="nav nav--language dropdown {$app.cms.properties->getWidgetProperty('style.container')}" id="widget-{$app.cms.widget}">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">{$app.locale} <i class="icon icon--chevron-down"></i></a>
        <ul class="dropdown__menu dropdown__menu--over dropdown__menu--right locales {$app.cms.properties->getWidgetProperty('style.menu')}" role="menu">
        {foreach $locales as $code => $data}
            {if !$data.url}
                {continue}
            {/if}

            {$locale = $data.locale}
            <li><a href="{$data.url}"{if $code == $app.locale} class="active"{/if}>{$code}</a></li>
        {/foreach}
        </ul>
    </div>
{/if}

