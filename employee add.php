<?php
require_once 'config/database.php';
require_once 'includes/header.php';

// Check if user is logged in and has permission
session_start();
if (!isset($_SESSION['user_id']) || $_SESSION['role'] !== 'admin') {
    header('Location: login.php');
    exit;
}

// Fetch departments for dropdown
$departments = $pdo->query("SELECT * FROM departments")->fetchAll(PDO::FETCH_ASSOC);

// Handle form submission
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $firstName = $_POST['first_name'];
    $lastName = $_POST['last_name'];
    $email = $_POST['email'];
    $phone = $_POST['phone'];
    $departmentId = $_POST['department_id'];
    $position = $_POST['position'];
    $salary = $_POST['salary'];
    $hireDate = $_POST['hire_date'];
    $address = $_POST['address'];

    $stmt = $pdo->prepare("INSERT INTO employees (first_name, last_name, email, phone, department_id, position, salary, hire_date, address) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
    $stmt->execute([$firstName, $lastName, $email, $phone, $departmentId, $position, $salary, $hireDate, $address]);

    header('Location: employees.php');
    exit;
}
?>

<h2>Add New Employee</h2>
<form method="POST">
    <div class="row">
        <div class="col-md-6">
            <div class="mb-3">
                <label for="first_name" class="form-label">First Name</label>
                <input type="text" class="form-control" id="first_name" name="first_name" required>
            </div>
        </div>
        <div class="col-md-6">
            <div class="mb-3">
                <label for="last_name" class="form-label">Last Name</label>
                <input type="text" class="form-control" id="last_name" name="last_name" required>
            </div>
        </div>
    </div>
    
    <div class="mb-3">
        <label for="email" class="form-label">Email</label>
        <input type="email" class="form-control" id="email" name="email" required>
    </div>
    
    <div class="mb-3">
        <label for="phone" class="form-label">Phone</label>
        <input type="tel" class="form-control" id="phone" name="phone">
    </div>
    
    <div class="mb-3">
        <label for="department_id" class="form-label">Department</label>
        <select class="form-select" id="department_id" name="department_id">
            <option value="">Select Department</option>
            <?php foreach ($departments as $department): ?>
                <option value="<?php echo $department['id']; ?>"><?php echo htmlspecialchars($department['name']); ?></option>
            <?php endforeach; ?>
        </select>
    </div>
    
    <div class="mb-3">
        <label for="position" class="form-label">Position</label>
        <input type="text" class="form-control" id="position" name="position">
    </div>
    
    <div class="mb-3">
        <label for="salary" class="form-label">Salary</label>
        <input type="number" step="0.01" class="form-control" id="salary" name="salary">
    </div>
    
    <div class="mb-3">
        <label for="hire_date" class="form-label">Hire Date</label>
        <input type="date" class="form-control" id="hire_date" name="hire_date">
    </div>
    
    <div class="mb-3">
        <label for="address" class="form-label">Address</label>
        <textarea class="form-control" id="address" name="address" rows="3"></textarea>
    </div>
    
    <button type="submit" class="btn btn-primary">Save Employee</button>
    <a href="employees.php" class="btn btn-secondary">Cancel</a>
</form>

<?php require_once 'includes/footer.php'; ?>