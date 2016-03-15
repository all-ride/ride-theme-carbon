{function name="richContentItems" items=null}
    {if $items}
        {foreach $items->data as $item}
            {$function = "richContent`$item->type|ucwords`"}
            {call $function data=$item->data}
        {/foreach}
    {/if}
{/function}

{function name="richContentHeading" data=null}
    <h2>{$data->text|text}</h2>
{/function}

{function name="richContentQuote" data=null}
    <blockquote class="quote">
        <p>{$data->text|text}</p>
        {if $data->cite}
            <footer>- <cite class="quote__text">{$data->cite}</cite></footer>
        {/if}
    </blockquote>
{/function}

{function name="richContentText" data=null}
    {$data->text|text}
{/function}

{function name="richContentWysiwyg" data=null}
    {richContentText data=$data}
{/function}

{function name="richContentList" data=null}
    <ul class="list--unordered">
    {foreach $data->listItems as $item}
        <li>{$item->content}</li>
    {/foreach}
    </ul>
{/function}

{function name="richContentVideo" data=null}
    {* {$data|k} *}
{/function}

{function name="richContentImage" data=null}
    {* {$data|k} *}
{/function}

{function name="richContentAsset" data=null}
    {$imageStyle = 'medium-image'}
    {if $data->className == 'stretch'}
        {$imageStyle = 'large-image'}
    {/if}

    {"[[asset.`$data->id`.`$imageStyle`.`$data->className`]]"|text}
{/function}

{function name="richContentTweet" data=null}
    {$data->embedCode}
{/function}
