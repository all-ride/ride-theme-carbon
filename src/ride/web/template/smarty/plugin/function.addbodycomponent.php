<?php

function smarty_function_addBodyComponent($params, &$smarty) {
    $app = $smarty->getTemplateVars('app');
    kd($params, $app['cms']['node']);
    $src = null;

    // try {
    //     if (!isset($params['src']) || !$params['src']) {
    //         throw new Exception('Could not add style: no src parameter provided');
    //     }
    //     $src = $params['src'];

    //     $app = $smarty->getTemplateVars('app');
    //     if (!isset($app['minifier']['scripts'])) {
    //         $app['minifier']['scripts'] = array();
    //     }

    //     $app['minifier']['scripts'][$src] = true;

    //     $smarty->assign('app', $app);
    // } catch (Exception $exception) {
    //     $app = $smarty->getTemplateVars('app');
    //     if (isset($app['system'])) {
    //         $log = $app['system']->getDependencyInjector()->get('ride\\library\\log\\Log');
    //         $log->logException($exception);
    //     }
    // }

    return 'ddd';
}
