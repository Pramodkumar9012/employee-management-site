<?php
require_once 'config/database.php';
require_once 'includes/header.php';

// Check if user is logged in
session_start();
if (!isset($_SESSION['user_id'])) {
    header('Location: login.php');
    exit;
}

// Fetch employees
$stmt = $pdo->query("SELECT e.*, d.name as department_name 
                     FROM employees e 
                     LEFT JOIN departments d ON e.department_id = d.id 
                     ORDER BY e.last_name");
$employees = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>

<h2>Employee List</h2>
<a href="add_employee.php" class="btn btn-success mb-3">Add New Employee</a>

<table class="table table-striped table-hover">
    <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Department</th>
            <th>Position</th>
            <th>Actions</th>
        </tr>
    </thead>
    <tbody>
        <?php foreach ($employees as $employee): ?>
        <tr>
            <td><?php echo $employee['id']; ?></td>
            <td><?php echo htmlspecialchars($employee['first_name'] . ' ' . $employee['last_name']); ?></td>
            <td><?php echo htmlspecialchars($employee['email']); ?></td>
            <td><?php echo htmlspecialchars($employee['department_name'] ?? 'N/A'); ?></td>
            <td><?php echo htmlspecialchars($employee['position']); ?></td>
            <td>
                <a href="edit_employee.php?id=<?php echo $employee['id']; ?>" class="btn btn-sm btn-primary">Edit</a>
                <a href="delete_employee.php?id=<?php echo $employee['id']; ?>" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure?')">Delete</a>
            </td>
        </tr>
        <?php endforeach; ?>
    </tbody>
</table>

<?php require_once 'includes/footer.php'; ?>