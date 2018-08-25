"" Originally taken from https://github.com/timonv/vim-cargo
""

" TODO: why those ?
" autocmd BufRead,BufNewFile Cargo.toml,Cargo.lock,*.rs compiler cargo
" autocmd BufRead,BufNewFile Cargo.toml,Cargo.lock,*.rs setlocal makeprg=cargo

command! -nargs=* CargoBench execute ('! cargo bench ' . <q-args>)
command! -nargs=* CargoBuild execute ('! cargo build ' . <q-args>)
command! -nargs=* CargoCheck execute ('! cargo check ' . <q-args>)
command! -nargs=* CargoClean execute ('! cargo clean ' . <q-args>)
command! -nargs=* CargoDoc execute ('! cargo doc ' . <q-args>)
command! -nargs=* CargoRun execute ('! cargo run ' . <q-args>)
command! -nargs=* CargoTest execute ('! cargo test ' . <q-args>)
command! -nargs=* CargoUpdate execute ('! cargo update ' . <q-args>)
command! -complete=file -nargs=+ CargoNew execute ('! cargo new ' . <q-args>)

" assumes the existance of cargo-edit
command! -nargs=+ CargoAdd execute ('! cargo add ' . <q-args>)
command! -nargs=+ CargoRm execute ('! cargo rm ' . <q-args>)
command! -nargs=+ CargoUpgrade execute ('! cargo upgrade ' . <q-args>)

"" Placeholder function, once called it
"" would cause vim to load this file
function cargo#init ()
endfunction
