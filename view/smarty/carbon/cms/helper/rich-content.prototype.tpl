{function richContentItems items=null}
    {if $items}
        {foreach $items->data as $item}
            {$function = "richContent{$item->type|ucwords}"}
            {call $function data=$item->data}
        {/foreach}
    {/if}
{/function}

{function richContentHeading data=null}
    <h2>{$data->text|text}</h2>
{/function}

{function richContentQuote data=null}
    <blockquote class="quote">
        <p>{$data->text|text}</p>
        {if $data->cite}
            <footer>- <cite class="quote__text">{$data->cite}</cite></footer>
        {/if}
    </blockquote>
{/function}

{function richContentText data=null}
    {$data->text|text}
{/function}

{function richContentWysiwyg data=null}
    {richContentText data=$data}
{/function}

{function richContentList data=null}
    <ul class="list--unordered">
    {foreach $data->listItems as $item}
        <li>{$item->content}</li>
    {/foreach}
    </ul>
{/function}

{function richContentVideo data=null}
    {* {$data|k} *}
{/function}

{function richContentImage data=null}
    {* {$data|k} *}
{/function}

{function richContentAsset data=null}
    {$imageStyle = 'medium-image'}
    {if $data->className == 'stretch'}
        {$imageStyle = 'large-image'}
    {/if}

    {"[[asset.`$data->id`.`$imageStyle`.`$data->className`]]"|text}
{/function}

{function richContentTweet data=null}
    {$data->embedCode}
{/function}
