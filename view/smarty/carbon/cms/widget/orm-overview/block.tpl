{* widget: orm.overview action: index; translation: template.orm.overview.block *}

{include 'cms/helper/general'}
{include 'cms/helper/orm-overview'}

<div class="block {if isset($app['cms']['properties'])}{$app['cms']['properties']->getWidgetProperty('style.container')}{/if}"
     {if isset($app['cms']['widget'])}id="widget-{$app['cms']['widget']}"{/if}>

    {call renderTitle title=$title}

    {call renderFilter filters=$filters}

    {if $result}
    {foreach $result as $content}
    {$cardClass = "card card--{$content->type|strtolower}"}

    {if $content->url}
    <a href="{$content->url}" class="{$cardClass} card--link">
        {else}
        <div class="{$cardClass}">
            {/if}

            {if $content->image}
                <div class="card__aside">
                    {call renderImage image=$content->image}
                </div>
            {/if}
            <div class="card__main">
                <div class="card__header">
                    <h3 class="card__title">{$content->title}</h3>
                </div>
                <div class="card__content">
                    <p class="card__text">{$content->teaser|text}</p>
                    {if $content->url}
                        <span class="card__link">{'label.more.link'|translate}</span>
                    {/if}
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
