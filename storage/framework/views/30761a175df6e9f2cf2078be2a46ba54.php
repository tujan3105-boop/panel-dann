<?php $__env->startSection('container'); ?>
    <?php echo $__env->yieldContent('content'); ?>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('templates.wrapper', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH /var/gantengdann/resources/views/templates/auth/core.blade.php ENDPATH**/ ?>