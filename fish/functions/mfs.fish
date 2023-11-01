function mfs --wraps='php artisan migrate:fresh --seed' --description 'alias mfs=php artisan migrate:fresh --seed'
  php artisan migrate:fresh --seed $argv
        
end
