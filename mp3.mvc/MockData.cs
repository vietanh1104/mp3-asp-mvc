using mp3.mvc.Enums;
using mp3.mvc.Infrastructure.Entities;

namespace mp3.mvc
{
    public static class MockData
    {
        public static List<User> UserData = new List<User>()
        {
            new User
            {
                Id = Guid.Parse("00000000-0000-0000-0000-000000000001"),
                Username = "user1",
                DisplayName = "Cấn Việt Anh 1",
                Gender = (int)GenderType.male,
                Address = "Kim Quan, Thạch Thất, Hà Nội",
                AvatarUrl = "/images/avatars/user1.jpg",
                Balance = 1000000,
                Dob = DateTime.Now,
                PhoneNumber = "1234567890",
                Email = "abc@gmail.com",
                IsAdmin = false,
                IsLocked = false,
                CreatedAt = DateTime.Now,
                UpdatedAt = DateTime.Now,
            },
            new User
            {
                Id = Guid.Parse("00000000-0000-0000-0000-000000000002"),
                Username = "user2",
                DisplayName = "Cấn Việt Anh 2",
                Gender = (int)GenderType.female,
                Address = "Lập Thạch, Vĩnh Phúc",
                AvatarUrl = "/images/avatars/user1.jpg",
                Balance = 2000000,
                Dob = DateTime.Now,
                PhoneNumber = "1234567890",
                Email = "abc@gmail.com",
                IsAdmin = false,
                IsLocked = false,
                CreatedAt = DateTime.Now,
                UpdatedAt = DateTime.Now,
            },
            new User
            {
                Id = Guid.Parse("00000000-0000-0000-0000-000000000003"),
                Username = "user3",
                DisplayName = "Cấn Việt Anh 3",
                Gender = (int)GenderType.male,
                Address = "Thạch Thất, Hà Nội",
                AvatarUrl ="/images/avatars/user1.jpg",
                Balance = 0,
                Dob = DateTime.Now,
                PhoneNumber = "1234567890",
                Email = "abc@gmail.com",
                IsAdmin = false,
                IsLocked = true,
                CreatedAt = DateTime.Now,
                UpdatedAt = DateTime.Now,
            },
            new User
            {
                Id = Guid.Parse("00000000-0000-0000-0000-000000000004"),
                Username = "admin",
                DisplayName = "Cấn Việt Anh",
                Gender = (int)GenderType.male,
                Address = "Kim Quan, Thạch Thất, Hà Nội",
                AvatarUrl = "/images/avatars/user1.jpg",
                Balance = 1000000,
                Dob = DateTime.Now,
                PhoneNumber = "1234567890",
                Email = "abc@gmail.com",
                IsAdmin = true,
                IsLocked = false,
                CreatedAt = DateTime.Now,
                UpdatedAt = DateTime.Now,
            }
        };
        public static List<Author> AuthorData = new List<Author>()
        {
            new Author()
            {
                Id = Guid.Parse("00000002-0000-0000-0000-000000000001"),
                Name = "anonymous",
            },
            new Author()
            {
                Id = Guid.Parse("00000002-0000-0000-0000-000000000002"),
                Name = "Sơn Tùng MTP",
            },
            new Author()
            {
                Id = Guid.Parse("00000002-0000-0000-0000-000000000003"),
                Name = "Đen Vâu",
            },
            new Author()
            {
                Id = Guid.Parse("00000002-0000-0000-0000-000000000004"),
                Name = "BigBang",
            },
        };
        public static List<Category> CategoryData = new List<Category>()
        {
            new Category
            {
                Id = Guid.Parse("00000003-0000-0000-0000-000000000001"),
                Name = "Unknown"
            },
            new Category
            {
                Id = Guid.Parse("00000003-0000-0000-0000-000000000002"),
                Name = "Pop"
            },
            new Category
            {
                Id = Guid.Parse("00000003-0000-0000-0000-000000000003"),
                Name = "Folk"
            },
            new Category
            {
                Id = Guid.Parse("00000003-0000-0000-0000-000000000004"),
                Name = "Country"
            },
            new Category
            {
                Id = Guid.Parse("00000003-0000-0000-0000-000000000005"),
                Name = "Rap"
            },
        };
        public static List<Media> MediaData = new List<Media>()
        {
            new Media
            {
                Id = Guid.Parse("00000001-0000-0000-0000-000000000001"),
                UserId = UserData[0].Id,
                User = UserData[0],
                Name = "Chúng ta của hiện tại",
                MediaContent = new List<MediaContent>
                {
                    new MediaContent
                    {
                        Id = Guid.Parse("00000001-0001-0000-0000-000000000001"),
                        MediaId = Guid.Parse("00000001-0000-0000-0000-000000000001"),
                        Value = "/images/media/chung_ta_cua_hien_tai.jpg",
                        Type = (int) MediaContentType.image,
                        CreatedAt = DateTime.Now,
                        UpdatedAt = DateTime.Now,
                    },
                    new MediaContent
                    {
                        Id = Guid.Parse("00000001-0001-0000-0000-000000000002"),
                        MediaId = Guid.Parse("00000001-0000-0000-0000-000000000001"),
                        Value = "/images/media/chung_ta_cua_hien_tai.jpg",
                        Type = (int) MediaContentType.image,
                        CreatedAt = DateTime.Now,
                        UpdatedAt = DateTime.Now,
                    }
                },
                Price = 1000000,
                Type = (int)MediaType.audio,
                ContentUrl = "",
                Description = "",
                IsHidden = false,
                IsLocked = false,
                CreatedAt = DateTime.Now,
                UpdatedAt = DateTime.Now,
                AuthorId = AuthorData[1].Id,
                Author = AuthorData[1],
                CategoryId = CategoryData[1].Id,
                Category = CategoryData[1],             
            },
            new Media
            {
                Id = Guid.Parse("00000001-0000-0000-0000-000000000002"),
                UserId = UserData[0].Id,
                User = UserData[0],
                Name = "Chắc ai đó sẽ về",
                MediaContent = new List<MediaContent>
                {
                    new MediaContent
                    {
                        Id = Guid.Parse("00000001-0001-0000-0000-000000000003"),
                        MediaId = Guid.Parse("00000001-0000-0000-0000-000000000002"),
                        Value = "/images/media/chac_ai_do_se_ve.jpg",
                        Type = (int) MediaContentType.image,
                        CreatedAt = DateTime.Now,
                        UpdatedAt = DateTime.Now,
                    },
                    new MediaContent
                    {
                        Id = Guid.Parse("00000001-0001-0000-0000-000000000004"),
                        MediaId = Guid.Parse("00000001-0000-0000-0000-000000000002"),
                        Value = "/images/media/chac_ai_do_se_ve.jpg",
                        Type = (int) MediaContentType.image,
                        CreatedAt = DateTime.Now,
                        UpdatedAt = DateTime.Now,
                    }
                },
                Price = 2000000,
                Type = (int)MediaType.audio,
                ContentUrl = "",
                Description = "",
                IsHidden = false,
                IsLocked = false,
                CreatedAt = DateTime.Now,
                UpdatedAt = DateTime.Now,
                AuthorId = AuthorData[1].Id,
                Author = AuthorData[1],
                CategoryId = CategoryData[1].Id,
                Category = CategoryData[1],
            },
            new Media
            {
                Id = Guid.Parse("00000001-0000-0000-0000-000000000003"),
                UserId = UserData[0].Id,
                User = UserData[0],
                Name = "Blue",
                MediaContent = new List<MediaContent>
                {
                    new MediaContent
                    {
                        Id = Guid.Parse("00000001-0001-0000-0000-000000000005"),
                        MediaId = Guid.Parse("00000001-0000-0000-0000-000000000003"),
                        Value = "/images/media/blue.jpg",
                        Type = (int) MediaContentType.image,
                        CreatedAt = DateTime.Now,
                        UpdatedAt = DateTime.Now,
                    },
                    new MediaContent
                    {
                        Id = Guid.Parse("00000001-0001-0000-0000-000000000006"),
                        MediaId = Guid.Parse("00000001-0000-0000-0000-000000000003"),
                        Value = "/images/media/blue.jpg",
                        Type = (int) MediaContentType.image,
                        CreatedAt = DateTime.Now,
                        UpdatedAt = DateTime.Now,
                    }
                },
                Price = 500000,
                Type = (int)MediaType.audio,
                ContentUrl = "",
                Description = "",
                IsHidden = false,
                IsLocked = false,
                CreatedAt = DateTime.Now,
                UpdatedAt = DateTime.Now,
                AuthorId = AuthorData[3].Id,
                Author = AuthorData[3],
                CategoryId = CategoryData[4].Id,
                Category = CategoryData[4],
            },
            new Media
            {
                Id = Guid.Parse("00000001-0000-0000-0000-000000000004"),
                UserId = UserData[1].Id,
                User = UserData[1],
                Name = "Let not fall in love",
                MediaContent = new List<MediaContent>
                {
                    new MediaContent
                    {
                        Id = Guid.Parse("00000001-0001-0000-0000-000000000007"),
                        MediaId = Guid.Parse("00000001-0000-0000-0000-000000000004"),
                        Value = "/images/media/let_not_fall_in_love.jpg",
                        Type = (int) MediaContentType.image,
                        CreatedAt = DateTime.Now,
                        UpdatedAt = DateTime.Now,
                    },
                    new MediaContent
                    {
                        Id = Guid.Parse("00000001-0001-0000-0000-000000000008"),
                        MediaId = Guid.Parse("00000001-0000-0000-0000-000000000004"),
                        Value = "/images/media/let_not_fall_in_love.jpg",
                        Type = (int) MediaContentType.image,
                        CreatedAt = DateTime.Now,
                        UpdatedAt = DateTime.Now,
                    }
                },
                Price = 2000000,
                Type = (int)MediaType.audio,
                ContentUrl = "",
                Description = "",
                IsHidden = false,
                IsLocked = false,
                CreatedAt = DateTime.Now,
                UpdatedAt = DateTime.Now,
                AuthorId = AuthorData[3].Id,
                Author = AuthorData[3],
                CategoryId = CategoryData[4].Id,
                Category = CategoryData[4],
            },
            new Media
            {
                Id = Guid.Parse("00000001-0000-0000-0000-000000000005"),
                UserId = UserData[2].Id,
                User = UserData[2],
                Name = "Chạy ngay đi",
                MediaContent = new List<MediaContent>
                {
                    new MediaContent
                    {
                        Id = Guid.Parse("00000001-0001-0000-0000-000000000009"),
                        MediaId = Guid.Parse("00000001-0000-0000-0000-000000000005"),
                        Value = "/images/media/chay_ngay_di.jpg",
                        Type = (int) MediaContentType.image,
                        CreatedAt = DateTime.Now,
                        UpdatedAt = DateTime.Now,
                    },
                    new MediaContent
                    {
                        Id = Guid.Parse("00000001-0001-0000-0000-000000000010"),
                        MediaId = Guid.Parse("00000001-0000-0000-0000-000000000005"),
                        Value = "/images/media/chay_ngay_di.jpg",
                        Type = (int) MediaContentType.image,
                        CreatedAt = DateTime.Now,
                        UpdatedAt = DateTime.Now,
                    }
                },
                Price = 500000,
                Type = (int)MediaType.audio,
                ContentUrl = "",
                Description = "",
                IsHidden = false,
                IsLocked = false,
                CreatedAt = DateTime.Now,
                UpdatedAt = DateTime.Now,
                AuthorId = AuthorData[1].Id,
                Author = AuthorData[1],
                CategoryId = CategoryData[1].Id,
                Category = CategoryData[1],
            },
        };
    }
}
