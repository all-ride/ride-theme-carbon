{* widget: language.select; action: index; translation: widget.language.select *}

{if $locales|count > 1}
    <div class="nav nav--language {if isset($app['cms']['properties'])}{$app['cms']['properties']->getWidgetProperty('style.container')}{/if}" {if isset($app['cms']['widget'])}id="widget-{$app.cms.widget}"{/if}>
        <ul class="locales {if isset($app['cms']['properties'])}{$app['cms']['properties']->getWidgetProperty('style.menu')}{/if}">
            {foreach $locales as $code => $data}
                {if !isset($data['url'])}
                    {continue}
                {/if}

                {$locale = isset($data['locale']) ? $data['locale'] : $app['locale']}
                <li><a href="{$data['url']}"{if $code == $app['locale']} class="active"{/if}>{$code}</a></li>
            {/foreach}
        </ul>
    </div>
{/if}
