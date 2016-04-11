<div class="block {$app.cms.properties->getWidgetProperty('style.container')}" id="widget-{$app.cms.widget}">
{if $result.total == 0}
    {if $query}
        <p>{translate key='label.search.query.none' query=$query}</p>
    {else}
        <p>{'label.search.query.provide'|translate}</p>
    {/if}
{else}
    {if $result.total == 1}
        <p>{translate key='label.search.query.result' query=$query}</p>
    {else}
        <p>{translate key='label.search.query.results' query=$query total=$result.total}</p>
    {/if}

    {foreach $result.types as $contentType => $contentResult}
        {$entries = $contentResult->getEntries()}

        {if $entries}
        <div class="search-type">
            {* <h3>{$contentType}</h3> *}
            {foreach $entries as $content}
                {$excerptClass = "excerpt excerpt--{$content->type|strtolower} excerpt--{cycle values="odd,even"}"}
                {if $content->url}
                    <a href="{$content->url}" class="{$excerptClass}">
                {else}
                    <div class="{$excerptClass}">
                {/if}
                    {if $content->image}
                        <div class="excerpt__aside">
                            <div class="excerpt__img">
                                <img src="{image src=$content->image width=125 height=125 transformation='resize'}" alt="" class="image image--full-width">
                            </div>
                        </div>
                    {/if}
                    <div class="excerpt__main">
                        <div class="excerpt__header">
                            <h3 class="excerpt__title">{$content->title}</h3>
                        </div>
                        <div class="excerpt__ct">
                            {$content->teaser}
                            {if $content->url}<span class="excerpt__link">{'label.readmore'|translate} &rsaquo;</span>{/if}
                        </div>
                    </div>
                {if $content->url}
                    </a>
                {else}
                    </div>
                {/if}
            {/foreach}

            {if $urlMore}
                {$numResults = $entries|@count}
                {$totalNumResults = $contentResult->getTotal()}
                {$remainingResults = $totalNumResults - $numResults}
                {if $remainingResults}
                <div class="block">
                    <a href="{$urlMore}&amp;type={$contentType}">{translate key='button.search.results.more' total=$remainingResults}</a>
                </div>
                {/if}
            {/if}
        </div>
        {/if}
    {/foreach}
{/if}

</div>
