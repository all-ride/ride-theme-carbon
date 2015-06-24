{* widget: orm.overview action: index; translation: template.orm.overview.block *}

{include 'cms/helper/orm-overview'}


{include 'cms/helper/general'}
{include 'cms/helper/orm-overview'}

<div class="block {$app.cms.properties->getWidgetProperty('style.container')}" id="widget-{$app.cms.widget}">

    {call renderTitle title=$title}

    {call renderFilter filters=$filters}

    {if $result}
        {foreach from=$result item="content"}
            {$excerptClass = "excerpt excerpt--{$content->type|strtolower} excerpt--{cycle values="odd,even"}"}

            {if $content->url}
                <a href="{$content->url}" class="{$excerptClass} excerpt--link">
            {else}
                <div class="{$excerptClass}">
            {/if}
                {if $content->image}
                    <div class="excerpt__aside">
                        {call renderImage image=$content->image}
                    </div>
                {/if}
                <div class="excerpt__main">
                    <div class="excerpt__header">
                        <h3 class="excerpt__title">{$content->title}</h3>
                    </div>
                    <div class="excerpt__ct">
                        <p>{$content->teaser|text}</p>
                        {if $content->url}<span class="excerpt__link spacer--xsm">{translate key="label.readmore"} &rsaquo;</span>{/if}
                    </div>
                </div>
            {if $content->url}
                </a>
            {else}
                </div>
            {/if}

        {/foreach}

        {call renderPagination pagination=$pagination}

        {call renderMore moreUrl=$moreUrl moreLabel=$moreLabel}
    {else}
        {call renderEmpty emptyResultMessage=$emptyResultMessage}
    {/if}
</div>