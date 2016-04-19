{include 'cms/helper/layout'}

{function layout_25_75 section=null widgets=null}

    {$blocks = []}
    {$blocks['1'] = 'grid__12 grid--bp-med__3'}
    {$blocks['2'] = 'grid__12 grid--bp-med__9'}

    {call renderLayout blocks=$blocks}
    
{/function}
