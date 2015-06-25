{function renderTitle title=null}
    {if $title}
        <h2 class="toc {$app.cms.properties->getWidgetProperty('style.title')}">{$title}</h2>
    {/if}
{/function}

{function renderFilter filters=null}
    {if $filters}
        {include 'cms/helper/orm.filter.form'}
    {/if}
{/function}

{function renderPagination pagination=null}
    {if $pagination}
        {if $pagination->getPages() >= $pagination->getPage() && $pagination->getPages() > 1}
            <div class="pagination">
                {pagination href=$pagination->getHref() pages=$pagination->getPages() page=$pagination->getPage()}
            </div>
        {/if}
    {/if}
{/function}

{function renderMore moreUrl=null moreLabel=null}
    {if $moreUrl}
        <div class="excerpt__more">
            <a href="{$moreUrl}" class="excpert__more-link link--ext">{$moreLabel}</a>
        </div>
    {/if}
{/function}

{function renderEmpty emptyResultMessage=null}
    <p class="excerpt__empty">{$emptyResultMessage|text}</p>
{/function}

{function renderMeta meta=null}
    <div class="meta">
        {foreach $meta as $itemClass => $item}
            <div class="meta__item meta__item--{$itemClass}">{$item}</div>
        {/foreach}
    </div>
{/function}

{function renderTags tags=null}
    <div class="excerpt__tags tags spacer--xsm">
        {foreach $tags as $tag}
            <div class="tag">{$tag->getName()}</div>
        {/foreach}
    </div>
{/function}

{function renderImage image=null width=140 height=105 transformation="crop"}
    <div class="excerpt__img">
        <img src="{image src=$image width=$width height=$height transformation=$transformation}" class="image image--responsive" />
    </div>
{/function}
