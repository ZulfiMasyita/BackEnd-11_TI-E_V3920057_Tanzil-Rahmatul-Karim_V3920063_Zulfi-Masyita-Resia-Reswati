<main role="main" class="container">
    <div class="row">
        <div class="col-md-10 mx-auto">
            <div class="card">
                <div class="card-header">
                    <span>Formulir Kategori</span>
                </div>
                <div class="card-body">
                    <?= form_open($form_action, ['method' => 'POST']) ?>
                    <?= isset($input->id) ? form_hidden('id', $input->id) : '' ?>
                    <div class="form-group">
                        <label for="">Kategori</label>
                        <?= form_input('title', $input->title, ['class' => 'form-control', 'id' => 'title', 'onkeyup' => 'createSlug()', 'required' => true, 'autofocus' => true]) ?>
                        <?= form_error('title') ?>
                    </div>
                    <br>
                    <div class="form-group">
                        <label for="">Status stok</label>
                        <br>
                        <div class="form-check form-check-inline">
                            <?= form_checkbox(['name' => 'status', 'value' => 'Pre order', 'class' => 'form_check_input']) ?>
                            <label for="" class="form-check-label">Pre order</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <?= form_checkbox(['name' => 'status', 'value' => 'Ready', 'pre order', 'class' => 'form_check_input']) ?>
                            <label for="" class="form-check-label">Ready</label>
                        </div>
                    </div>
                    <br>
                    <div class="form-group">
                        <label for="">Keterangan</label>
                        <?= form_textarea(['name' => 'keterangan', 'value' => $input->keterangan, 'row' => 4, 'class' => 'form-control']) ?>
                        <?= form_error('keterangan') ?>
                    </div>
                    <br>
                    <div class="form-group">
                        <label for="">Slug</label>
                        <?= form_input('slug', $input->slug, ['class' => 'form-control', 'id' => 'slug', 'required' => true]) ?>
                        <?= form_error('slug') ?>
                    </div>
                    <button type="submit" class="btn btn-info">Simpan</button>
                    <?= form_close() ?>
                </div>
            </div>
        </div>
    </div>
</main>