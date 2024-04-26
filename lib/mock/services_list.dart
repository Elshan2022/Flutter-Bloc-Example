// ignore_for_file: public_member_api_docs, sort_constructors_first
class ServiceModel {
  String? id;
  String? name;
  String? surname;
  String? field;
  String? about;
  String? latitude;
  String? longitude;
  String? ratingRank;
  String? salary;
  String? image;
  ServiceModel({
    this.id,
    this.name,
    this.surname,
    this.field,
    this.about,
    this.latitude,
    this.longitude,
    this.ratingRank,
    this.salary,
    this.image,
  });

  ServiceModel copyWith({
    String? id,
    String? name,
    String? surname,
    String? field,
    String? about,
    String? latitude,
    String? longitude,
    String? ratingRank,
    String? salary,
    String? image,
  }) {
    return ServiceModel(
      id: id ?? this.id,
      name: name ?? this.name,
      surname: surname ?? this.surname,
      field: field ?? this.field,
      about: about ?? this.about,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      ratingRank: ratingRank ?? this.ratingRank,
      salary: salary ?? this.salary,
      image: image ?? this.image,
    );
  }

  static List<ServiceModel> serviceList = [
    ServiceModel(
      id: '1',
      name: 'John',
      surname: 'Doe',
      field: 'Plumbing',
      about:
          'Experienced plumber with over 10 years of experience. Specializes in both residential and commercial plumbing services. Committed to providing high-quality workmanship and excellent customer service. Trusted by many satisfied clients for reliable and efficient plumbing solutions. Always ready to tackle any plumbing issue with professionalism and expertise.',
      latitude: '40.37439845968968',
      longitude: '49.845896454035824',
      ratingRank: '4.5',
      salary: '50',
      image:
          'https://m.media-amazon.com/images/M/MV5BODUyNzM1NzY0NF5BMl5BanBnXkFtZTYwNjk5ODQ0._V1_FMjpg_UX1000_.jpg',
    ),
    ServiceModel(
      id: '2',
      name: 'Jane',
      surname: 'Smith',
      field: 'Plumbing',
      about:
          'Certified plumber offering reliable plumbing services. Has a strong track record of solving complex plumbing problems efficiently. Utilizes the latest tools and techniques to ensure quality work. Committed to meeting clients\' needs and exceeding their expectations. Available for emergency services and scheduled appointments.',
      latitude: '34.0522',
      longitude: '-118.2437',
      ratingRank: '4.8',
      salary: '60',
      image:
          'https://wac-cdn.atlassian.com/dam/jcr:ba03a215-2f45-40f5-8540-b2015223c918/Max-R_Headshot%20(1).jpg?cdnVersion=1575',
    ),
    ServiceModel(
      id: '3',
      name: 'Robert',
      surname: 'Williams',
      field: 'Plumbing',
      about:
          'Skilled plumber providing quality plumbing solutions. Offers a wide range of services, including pipe repair, drain cleaning, and fixture installation. Dedicated to ensuring customer satisfaction through exceptional service. Has a keen eye for detail and a commitment to excellence in every project. Trusted choice for all plumbing needs.',
      latitude: '41.8781',
      longitude: '-87.6298',
      ratingRank: '4.3',
      salary: '55',
      image:
          'https://plus.unsplash.com/premium_photo-1683121366070-5ceb7e007a97?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D',
    ),
    ServiceModel(
      id: '4',
      name: 'Emily',
      surname: 'Johnson',
      field: 'Plumbing',
      about:
          'Professional plumber with a focus on customer satisfaction. Offers personalized solutions to meet individual plumbing needs. Highly skilled in troubleshooting and problem-solving. Provides transparent pricing and honest advice. Committed to delivering timely and efficient services with a smile.',
      latitude: '29.7604',
      longitude: '-95.3698',
      ratingRank: '4.7',
      salary: '58',
      image:
          'https://www.safetyandhealthmagazine.com/ext/resources/images/news/construction/older-male-construction-worker.jpg?t=1698244045&width=696',
    ),
    ServiceModel(
      id: '5',
      name: 'Michael',
      surname: 'Clark',
      field: 'Electrical',
      about:
          'Experienced electrician with over 15 years of experience in residential and commercial electrical services. Specializes in electrical installations, repairs, and maintenance. Committed to providing safe and reliable electrical solutions tailored to each client\'s needs. Has a reputation for delivering high-quality workmanship and exceptional customer service. Always stays updated with the latest industry standards and technologies.',
      latitude: '40.7128',
      longitude: '-74.0060',
      ratingRank: '4.6',
      salary: '55',
      image:
          'https://www.peopleready.com/wp-content/uploads/2021/01/construction-industry.jpg',
    ),
    ServiceModel(
      id: '6',
      name: 'Sophia',
      surname: 'Martin',
      field: 'Electrical',
      about:
          'Certified electrician offering comprehensive electrical services. Highly skilled in troubleshooting electrical issues and providing effective solutions. Utilizes advanced tools and techniques to ensure precision and efficiency. Committed to delivering prompt and professional services with a focus on safety. Trusted by numerous clients for reliable and efficient electrical work.',
      latitude: '34.0522',
      longitude: '-118.2437',
      ratingRank: '4.9',
      salary: '60',
      image:
          'https://subcusa.com/wp-content/uploads/2023/12/Advancing-Opp-2-scaled.jpg',
    ),
    ServiceModel(
      id: '7',
      name: 'William',
      surname: 'Brown',
      field: 'Electrical',
      about:
          'Skilled electrician with a passion for excellence in every project. Offers a wide range of electrical services, including wiring, lighting, and panel upgrades. Dedicated to ensuring customer satisfaction by providing personalized solutions and attentive service. Has a keen eye for detail and a commitment to delivering outstanding results. Reliable choice for all electrical needs.',
      latitude: '41.8781',
      longitude: '-87.6298',
      ratingRank: '4.4',
      salary: '57',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcToifPrZriEgBfvf5GSU07OZbvz0YAdiAim8W9W8Kk98gEqc8ubMFjfffdqFUB76D4axRs&usqp=CAU',
    ),
    ServiceModel(
      id: '8',
      name: 'Olivia',
      surname: 'Wilson',
      field: 'Electrical',
      about:
          'Professional electrician with expertise in both residential and commercial electrical services. Focuses on delivering high-quality work while adhering to safety standards. Provides transparent pricing and clear communication throughout the project. Committed to completing projects on time and within budget. Trusted choice for dependable electrical solutions.',
      latitude: '29.7604',
      longitude: '-95.3698',
      ratingRank: '4.8',
      salary: '58',
      image:
          'https://bloximages.newyork1.vip.townnews.com/leader-call.com/content/tncms/assets/v3/editorial/2/38/238990cf-99ec-5a45-a49b-9644477b1ce5/65c6a7f0ec37e.image.jpg',
    ),
    ServiceModel(
      id: '9',
      name: 'David',
      surname: 'White',
      field: 'Repairing',
      about:
          'Experienced repair technician with over 12 years of experience in various repair services. Specializes in appliance repair, plumbing, and electrical repairs. Committed to providing prompt and reliable repair solutions tailored to each client\'s needs. Known for delivering high-quality workmanship and exceptional customer service. Always stays updated with the latest repair techniques and technologies.',
      latitude: '40.7128',
      longitude: '-74.0060',
      ratingRank: '4.7',
      salary: '52',
      image:
          'https://image.cnbcfm.com/api/v1/image/105420523-1535475566932civilengineer.jpg?v=1535475620&w=1920&h=1080',
    ),
    ServiceModel(
      id: '10',
      name: 'Emma',
      surname: 'Jones',
      field: 'Repairing',
      about:
          'Certified repair technician offering comprehensive repair services. Highly skilled in diagnosing and fixing a wide range of issues. Utilizes advanced tools and methods to ensure efficient and effective repairs. Committed to delivering prompt and professional services with a focus on customer satisfaction. Trusted by many clients for reliable and trustworthy repair work.',
      latitude: '34.0522',
      longitude: '-118.2437',
      ratingRank: '4.9',
      salary: '55',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSN21ia0awfyaeWmIttlua95V9qG8eUoBjD0V_j48AMuA&s',
    ),
    ServiceModel(
      id: '11',
      name: 'James',
      surname: 'Taylor',
      field: 'Repairing',
      about:
          'Skilled repair technician providing quality repair solutions for various appliances and systems. Offers a wide range of repair services, including HVAC, plumbing, and electrical repairs. Dedicated to ensuring customer satisfaction through exceptional service. Has a keen eye for detail and a commitment to excellence in every project. Reliable choice for all repair needs.',
      latitude: '41.8781',
      longitude: '-87.6298',
      ratingRank: '4.5',
      salary: '54',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQaUmU64XlqC1wwPvDJTimDdSdOdX3emH6In9Ee2NIkmVM0FDxip6l521JC4Prb3GPOCJA&usqp=CAU',
    ),
    ServiceModel(
      id: '12',
      name: 'Lily',
      surname: 'Brown',
      field: 'Repairing',
      about:
          'Professional repair technician with expertise in various repair services. Focuses on delivering high-quality repairs while adhering to safety standards. Provides transparent pricing and clear communication throughout the repair process. Committed to completing repairs on time and within budget. Trusted choice for dependable repair solutions.',
      latitude: '29.7604',
      longitude: '-95.3698',
      ratingRank: '4.8',
      salary: '56',
      image:
          'https://webassets.oxfamamerica.org/media/images/iStock-1264076515.2e16d0ba.fill-768x338.jpegquality-60.jpg',
    ),
    ServiceModel(
      id: '13',
      name: 'Sophie',
      surname: 'Wilson',
      field: 'Cleaning',
      about:
          'Experienced cleaner with over 10 years of experience in residential and commercial cleaning services. Specializes in deep cleaning, sanitization, and organizing spaces. Committed to providing impeccable cleaning solutions tailored to each client\'s needs. Known for delivering high-quality cleaning services with attention to detail. Always uses eco-friendly cleaning products for a healthier environment.',
      latitude: '40.7128',
      longitude: '-74.0060',
      ratingRank: '4.7',
      salary: '30',
      image:
          'https://us.softbankrobotics.com/hubfs/Clean%20SoftBank%20resized.jpg',
    ),
    ServiceModel(
      id: '14',
      name: 'Ethan',
      surname: 'Miller',
      field: 'Cleaning',
      about:
          'Certified cleaner offering comprehensive cleaning services. Highly skilled in various cleaning techniques and methods. Utilizes advanced cleaning equipment and environmentally friendly products to ensure thorough cleaning. Committed to delivering prompt and professional services with a focus on customer satisfaction. Trusted by numerous clients for reliable and efficient cleaning work.',
      latitude: '34.0522',
      longitude: '-118.2437',
      ratingRank: '4.9',
      salary: '32',
      image:
          'https://plus.unsplash.com/premium_photo-1667520405114-47d3677f966e?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ),
    ServiceModel(
      id: '15',
      name: 'Ava',
      surname: 'Johnson',
      field: 'Cleaning',
      about:
          'Skilled cleaner providing quality cleaning solutions for homes and offices. Offers a wide range of cleaning services, including regular cleaning, deep cleaning, and move-in/move-out cleaning. Dedicated to ensuring customer satisfaction through exceptional service. Has a keen eye for detail and a commitment to excellence in every cleaning project. Reliable choice for all cleaning needs.',
      latitude: '41.8781',
      longitude: '-87.6298',
      ratingRank: '4.6',
      salary: '31',
      image:
          'https://i2-prod.cambridge-news.co.uk/incoming/article18737730.ece/ALTERNATES/s615/1_JS141922522.jpg',
    ),
    ServiceModel(
      id: '16',
      name: 'Oliver',
      surname: 'Brown',
      field: 'Cleaning',
      about:
          'Professional cleaner with expertise in both residential and commercial cleaning services. Focuses on delivering high-quality cleaning while adhering to safety and hygiene standards. Provides transparent pricing and clear communication throughout the cleaning process. Committed to completing cleaning tasks on time and exceeding client expectations. Trusted choice for dependable cleaning solutions.',
      latitude: '29.7604',
      longitude: '-95.3698',
      ratingRank: '4.8',
      salary: '33',
      image:
          'https://www.theworkersunion.com/wp-content/uploads/2022/11/Union-Support-for-Cleaners.jpg',
    ),
    ServiceModel(
      id: '17',
      name: 'Benjamin',
      surname: 'Clark',
      field: 'Carpentry',
      about:
          'Experienced carpenter with over 15 years of experience in residential and commercial carpentry services. Specializes in custom furniture, cabinetry, and woodworking projects. Committed to providing high-quality craftsmanship and personalized solutions tailored to each client\'s needs. Known for attention to detail and creative design skills. Always delivers projects on time and within budget.',
      latitude: '40.7128',
      longitude: '-74.0060',
      ratingRank: '4.7',
      salary: '40',
      image:
          'https://cdn.britannica.com/77/148077-050-D790E99D/Carpenter-door-workshop.jpg',
    ),
    ServiceModel(
      id: '18',
      name: 'Isabella',
      surname: 'Martin',
      field: 'Carpentry',
      about:
          'Certified carpenter offering comprehensive carpentry services. Highly skilled in a variety of woodworking techniques and methods. Utilizes quality materials and advanced tools to ensure precise and durable results. Committed to delivering exceptional craftsmanship with a focus on customer satisfaction. Trusted by numerous clients for reliable and efficient carpentry work.',
      latitude: '34.0522',
      longitude: '-118.2437',
      ratingRank: '4.9',
      salary: '42',
      image:
          'https://facts.net/wp-content/uploads/2023/10/20-surprising-facts-about-carpentry-1696321212.jpg',
    ),
    ServiceModel(
      id: '19',
      name: 'Henry',
      surname: 'Taylor',
      field: 'Carpentry',
      about:
          'Skilled carpenter providing quality carpentry solutions for various projects. Offers a wide range of carpentry services, including framing, finishing, and custom woodworking. Dedicated to ensuring customer satisfaction through exceptional service. Has a keen eye for detail and a commitment to excellence in every project. Reliable choice for all carpentry needs.',
      latitude: '41.8781',
      longitude: '-87.6298',
      ratingRank: '4.6',
      salary: '41',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRC5xkhN_fx4QTTyS2B_KbYxEm1Ef8Rj6iDfs7UbMSD_8olW_yoQTgUcX4_pHOiyN6w2a0&usqp=CAU',
    ),
    ServiceModel(
      id: '20',
      name: 'Grace',
      surname: 'Wilson',
      field: 'Carpentry',
      about:
          'Professional carpenter with expertise in both residential and commercial carpentry services. Focuses on delivering high-quality carpentry while adhering to safety and building codes. Provides transparent pricing and clear communication throughout the carpentry process. Committed to completing projects on time and exceeding client expectations. Trusted choice for dependable carpentry solutions.',
      latitude: '29.7604',
      longitude: '-95.3698',
      ratingRank: '4.8',
      salary: '43',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRyWQTtJSM6o9JwLkMEmayCBwAdcnfp4iECBKQ4visgnSpf0Yh8Dulm7ZrzJs2Ixst8t60&usqp=CAU',
    ),
    ServiceModel(
      id: '21',
      name: 'Liam',
      surname: 'Johnson',
      field: 'Painting',
      about:
          'Experienced painter with over 10 years of experience in residential and commercial painting services. Specializes in interior and exterior painting, including wall painting, trim painting, and decorative finishes. Committed to providing high-quality workmanship and personalized color consultations. Known for attention to detail, precision, and excellent customer service. Always uses premium-quality paints and materials for long-lasting results.',
      latitude: '40.7128',
      longitude: '-74.0060',
      ratingRank: '4.7',
      salary: '35',
      image:
          'https://866attylaw.com/wp-content/uploads/2019/10/construction-site-painting-accident.jpg',
    ),
    ServiceModel(
      id: '22',
      name: 'Sophia',
      surname: 'Smith',
      field: 'Painting',
      about:
          'Certified painter offering comprehensive painting services. Highly skilled in various painting techniques and methods. Utilizes advanced equipment and high-quality paints to ensure smooth and even finishes. Committed to delivering prompt and professional services with a focus on customer satisfaction. Trusted by numerous clients for reliable and efficient painting work.',
      latitude: '34.0522',
      longitude: '-118.2437',
      ratingRank: '4.9',
      salary: '37',
      image:
          'https://thumbor.forbes.com/thumbor/fit-in/x/https://www.forbes.com/home-improvement/wp-content/uploads/2022/07/featured-image-painter.jpeg.jpg',
    ),
    ServiceModel(
      id: '23',
      name: 'Mason',
      surname: 'Williams',
      field: 'Painting',
      about:
          'Skilled painter providing quality painting solutions for homes and businesses. Offers a wide range of painting services, including interior, exterior, and specialty finishes. Dedicated to ensuring customer satisfaction through exceptional service. Has a keen eye for color coordination and a commitment to excellence in every painting project. Reliable choice for all painting needs.',
      latitude: '41.8781',
      longitude: '-87.6298',
      ratingRank: '4.6',
      salary: '36',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS90Min_QfkUQOS83bmsD3TfENm2ojAowrgMdjsJ-gJ1e6sqSR0_bj1XFLnWjFWxiYsNGU&usqp=CAU',
    ),
    ServiceModel(
      id: '24',
      name: 'Olivia',
      surname: 'Brown',
      field: 'Painting',
      about:
          'Professional painter with expertise in both residential and commercial painting services. Focuses on delivering high-quality painting while adhering to safety and environmental standards. Provides transparent pricing and clear communication throughout the painting process. Committed to completing painting projects on time and exceeding client expectations. Trusted choice for dependable painting solutions.',
      latitude: '29.7604',
      longitude: '-95.3698',
      ratingRank: '4.8',
      salary: '38',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIZPa7J-oKYwLWWFXdCqBITcMa0XbjoetO5xm99YJJ4f5PqtBI1BNHcxfCy__KanZ2lRs&usqp=CAU',
    ),
    ServiceModel(
      id: '25',
      name: 'Noah',
      surname: 'Davis',
      field: 'Moving',
      about:
          'Experienced mover with over 10 years of experience in residential and commercial moving services. Specializes in local and long-distance moves, including packing, loading, and unloading. Committed to providing efficient, reliable, and stress-free moving experiences for clients. Known for careful handling of belongings and timely deliveries. Always prioritizes customer satisfaction and safety.',
      latitude: '40.7128',
      longitude: '-74.0060',
      ratingRank: '4.7',
      salary: '45',
      image:
          'https://images.ctfassets.net/8edxnwlq2x0m/5mTzlnrKVFNNsjhwhomq3/5b423e8f7e01ea79426169520f58af1a/Moving_Company',
    ),
    ServiceModel(
      id: '26',
      name: 'Emma',
      surname: 'Wilson',
      field: 'Moving',
      about:
          'Certified mover offering comprehensive moving services. Highly skilled in packing, loading, and transporting items with care. Utilizes advanced equipment and techniques to ensure secure and efficient moves. Committed to delivering prompt and professional services with a focus on customer satisfaction. Trusted by numerous clients for reliable and efficient moving solutions.',
      latitude: '34.0522',
      longitude: '-118.2437',
      ratingRank: '4.9',
      salary: '47',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQOMBVewhr_OB6XRnGuH4h5ZOMx0mj67t43BKodntmZt72wf1rFTXbe4mRrxRksV3dvBqE&usqp=CAU',
    ),
    ServiceModel(
      id: '27',
      name: 'William',
      surname: 'Taylor',
      field: 'Moving',
      about:
          'Skilled mover providing quality moving solutions for residential and commercial clients. Offers a wide range of moving services, including packing, storage, and furniture assembly. Dedicated to ensuring customer satisfaction through exceptional service. Has a keen eye for detail and a commitment to excellence in every moving project. Reliable choice for all moving needs.',
      latitude: '41.8781',
      longitude: '-87.6298',
      ratingRank: '4.6',
      salary: '46',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQjgwmzxGqS-KC1DxJHGxFzM_qFPt4NRdDOQTG3vPNpWyLi_bMyx751SaLz4JZsKsWWBB8&usqp=CAU',
    ),
    ServiceModel(
      id: '28',
      name: 'Olivia',
      surname: 'Brown',
      field: 'Moving',
      about:
          'Professional mover with expertise in both residential and commercial moving services. Focuses on delivering high-quality moving solutions while adhering to safety standards. Provides transparent pricing and clear communication throughout the moving process. Committed to completing moves on time and with utmost care. Trusted choice for dependable moving services.',
      latitude: '29.7604',
      longitude: '-95.3698',
      ratingRank: '4.8',
      salary: '48',
      image:
          'https://d2rxt25e475whq.cloudfront.net/wp-content/uploads/2023/07/25230426/AdobeStock_592432590-962x500.jpeg.webp',
    ),
    ServiceModel(
      id: '29',
      name: 'Ethan',
      surname: 'Anderson',
      field: 'Handyman',
      about:
          'Experienced handyman with over 10 years of experience in various repair and maintenance services. Specializes in home repairs, installations, and improvements. Committed to providing reliable and efficient solutions tailored to each client\'s needs. Known for attention to detail, craftsmanship, and excellent customer service. Always ready to tackle a wide range of tasks with professionalism and expertise.',
      latitude: '40.7128',
      longitude: '-74.0060',
      ratingRank: '4.7',
      salary: '40',
      image:
          'https://www.4menearme.com/wp-content/uploads/2022/12/38186272_s-1024x682.jpg',
    ),
    ServiceModel(
      id: '30',
      name: 'Ava',
      surname: 'Jones',
      field: 'Handyman',
      about:
          'Certified handyman offering comprehensive repair and maintenance services. Highly skilled in plumbing, electrical work, and general home repairs. Utilizes advanced tools and techniques to ensure quality workmanship. Committed to delivering prompt and professional services with a focus on customer satisfaction. Trusted by numerous clients for reliable and efficient handyman services.',
      latitude: '34.0522',
      longitude: '-118.2437',
      ratingRank: '4.9',
      salary: '42',
      image:
          'https://f.hubspotusercontent30.net/hubfs/7718689/shutterstock_1704900061.jpg',
    ),
    ServiceModel(
      id: '31',
      name: 'Mason',
      surname: 'Williams',
      field: 'Handyman',
      about:
          'Skilled handyman providing quality repair and maintenance solutions for homes and businesses. Offers a wide range of handyman services, including carpentry, painting, and appliance repairs. Dedicated to ensuring customer satisfaction through exceptional service. Has a keen eye for detail and a commitment to excellence in every project. Reliable choice for all handyman needs.',
      latitude: '41.8781',
      longitude: '-87.6298',
      ratingRank: '4.6',
      salary: '41',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbfDFcGigjCgaDBV9tEF9nn375HINZlhK4kGQkgXLLDj8MBUFjQEp6FrxmnIC01cigs20&usqp=CAU',
    ),
    ServiceModel(
      id: '32',
      name: 'Oliver',
      surname: 'Brown',
      field: 'Handyman',
      about:
          'Professional handyman with expertise in various repair and maintenance services. Focuses on delivering high-quality work while adhering to safety standards. Provides transparent pricing and clear communication throughout the handyman process. Committed to completing tasks on time and exceeding client expectations. Trusted choice for dependable handyman services.',
      latitude: '29.7604',
      longitude: '-95.3698',
      ratingRank: '4.8',
      salary: '43',
      image:
          'https://getjobber.com/wp-content/uploads/2019/06/img-industryHero-handyman-1024x631.webp',
    ),
  ];
}
