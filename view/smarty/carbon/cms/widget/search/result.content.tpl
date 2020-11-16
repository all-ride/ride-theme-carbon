<div class="block {if isset($app['cms']['properties'])}{$app['cms']['properties']->getWidgetProperty('style.container')}{/if}" {if isset($app['cms']['widget'])}id="widget-{$app.cms.widget}"{/if}>
{if $result['total'] == 0}
    {if $query}
        <p>{translate key='label.search.query.none' query=$query}</p>
    {else}
        <p>{'label.search.query.provide'|translate}</p>
    {/if}
{else}
    {if $result['total'] == 1}
        <p>{translate key='label.search.query.result' query=$query}</p>
    {else}
        <p>{translate key='label.search.query.results' query=$query total=$result['total']}</p>
    {/if}

    {foreach $result['types'] as $contentType => $contentResult}
        {$entries = $contentResult->getEntries()}

        {if $entries}
        <div class="block">
            {* <h3>{$contentType}</h3> *}
            {foreach $entries as $content}
                {$cardClass = "card card--search"}
                {if $content->url}
                    <a href="{$content->url}" class="{$cardClass} card--link">
                {else}
                    <div class="{$cardClass}">
                {/if}
                    {if $content->image}
                        <div class="card__aside">
                            <div class="card__img">
                                <img src="{image src=$content->image transformation='resize' width=180}" alt="">
                            </div>
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
