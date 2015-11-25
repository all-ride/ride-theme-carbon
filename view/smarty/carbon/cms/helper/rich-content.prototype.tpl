{function name="richContentItems" items=null}
    {if $items}
        {foreach $items->data as $item}
            {$function = "richContent`$item->type|ucwords`"}
            {call $function data=$item->data}
        {/foreach}
    {/if}
{/function}

{function name="richContentHeading" data=null}
    <h2>{$data->text}</h2>
{/function}

{function name="richContentQuote" data=null}
    <div class="quote">
        <blockquote class="quote__text">{$data->text}</blockquote>
        <div class="quote__text">{$data->cite}</blockquote>
    </div>
{/function}

{function name="richContentText" data=null}
    {$data->text}
{/function}

{function name="richContentList" data=null}
    <ul class="list--unordered">
    {foreach $data->listItems as $item}
        <li>{$item->content}</li>
    {/foreach}
    </ul>
{/function}

{function name="richContentVideo" data=null}
    {$data|k}
{/function}

{function name="richContentImage" data=null}
    {$data|k}
{/function}