<table>
    <thead>
        <tr>
            <th>Username</th>
            <th>Email</th>
            <th>Actions</th>
        </tr>
    </thead>
    <tbody>
        <?php foreach ($users as $user): ?>
            <tr>
                <td><?= html_escape($user['uname']); ?></td>
                <td><?= html_escape($user['email']); ?></td>
                <td>
                    <a href="<?= base_url('user/user_view/' . $user['id']); ?>">View</a> |
                    <a href="<?= base_url('user/user_edit/' . $user['id']); ?>">Edit</a> |
                    <a href="<?= base_url('user/user_delete/' . $user['id']); ?>" 
                       onclick="return confirm('Are you sure you want to delete this user?');">Delete</a>
                </td>
            </tr>
        <?php endforeach; ?>
    </tbody>
</table>
