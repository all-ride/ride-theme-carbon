{* widget: language.select; action: index; translation: template.language.select.dropdown *}

{if $locales|count > 1}
    <div class="nav nav--language dropdown {if isset($app['cms']['properties'])}{$app['cms']['properties']->getWidgetProperty('style.container')}{/if}" {if isset($app['cms']['widget'])}id="widget-{$app['cms']['widget']}"{/if}>
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">{$app['locale']} <i class="icon icon--chevron-down"></i></a>
        <ul class="dropdown__menu dropdown__menu--over dropdown__menu--right locales {if isset($app['cms']['properties'])}{$app['cms']['properties']->getWidgetProperty('style.menu')}{/if}">
        {foreach $locales as $code => $data}
            {if !isset($data['url'])}
                {continue}
            {/if}

            {$locale = isset($data['locale']) ? $data['locale'] : $app['locale']}
            <li><a href="{$data['url']}"{if $code == $app('locale')} class="active"{/if}>{$code}</a></li>
        {/foreach}
        </ul>
    </div>
{/if}

