{* widget: orm.overview action: index; translation: template.orm.overview.list *}

{include 'cms/helper/orm-overview'}

<div class="block {if isset($app['cms']['properties'])}{$app['cms']['properties']->getWidgetProperty('style.container')}{/if}" {if isset($app['cms']['widget'])}id="widget-{$app['cms']['widget']}"{/if}>

    {call renderTitle title=$title}

    {call renderFilter filters=$filters}

    {if $result}
        <ul class="list--unordered">
            {foreach $result as $content}
                <li>
                {if $content->url}
                    <a href="{$content->url}">{$content->title}</a>
                {else}
                    {$content->title}
                {/if}
                </li>
            {/foreach}
        </ul>

        {call renderPagination pagination=$pagination}

        {call renderMore moreUrl=$moreUrl moreLabel=$moreLabel}
    {else}
        {call renderEmpty emptyResultMessage=$emptyResultMessage}
    {/if}
</div>
