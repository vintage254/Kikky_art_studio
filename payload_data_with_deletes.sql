BEGIN;
-- Empty tables first
DELETE FROM public."_pages_v";
DELETE FROM public."_pages_v_blocks_archive";
DELETE FROM public."_pages_v_blocks_content";
DELETE FROM public."_pages_v_blocks_content_columns";
DELETE FROM public."_pages_v_blocks_cta";
DELETE FROM public."_pages_v_blocks_cta_links";
DELETE FROM public."_pages_v_blocks_media_block";
DELETE FROM public."_pages_v_rels";
DELETE FROM public."_pages_v_version_hero_links";
DELETE FROM public."_products_v";
DELETE FROM public."_products_v_blocks_archive";
DELETE FROM public."_products_v_blocks_content";
DELETE FROM public."_products_v_blocks_content_columns";
DELETE FROM public."_products_v_blocks_cta";
DELETE FROM public."_products_v_blocks_cta_links";
DELETE FROM public."_products_v_blocks_media_block";
DELETE FROM public."_products_v_rels";
DELETE FROM public."categories";
DELETE FROM public."categories_breadcrumbs";
DELETE FROM public."categories_rels";
DELETE FROM public."footer";
DELETE FROM public."footer_nav_items";
DELETE FROM public."footer_rels";
DELETE FROM public."header";
DELETE FROM public."header_nav_items";
DELETE FROM public."header_rels";
DELETE FROM public."media";
DELETE FROM public."orders";
DELETE FROM public."orders_items";
DELETE FROM public."orders_rels";
DELETE FROM public."pages";
DELETE FROM public."pages_blocks_archive";
DELETE FROM public."pages_blocks_content";
DELETE FROM public."pages_blocks_content_columns";
DELETE FROM public."pages_blocks_cta";
DELETE FROM public."pages_blocks_cta_links";
DELETE FROM public."pages_blocks_media_block";
DELETE FROM public."pages_hero_links";
DELETE FROM public."pages_rels";
DELETE FROM public."payload_migrations";
DELETE FROM public."payload_preferences";
DELETE FROM public."payload_preferences_rels";
DELETE FROM public."products";
DELETE FROM public."products_blocks_archive";
DELETE FROM public."products_blocks_content";
DELETE FROM public."products_blocks_content_columns";
DELETE FROM public."products_blocks_cta";
DELETE FROM public."products_blocks_cta_links";
DELETE FROM public."products_blocks_media_block";
DELETE FROM public."products_rels";
DELETE FROM public."redirects";
DELETE FROM public."redirects_rels";
DELETE FROM public."settings";
DELETE FROM public."settings_rels";
DELETE FROM public."users";
DELETE FROM public."users_cart_items";
DELETE FROM public."users_rels";
DELETE FROM public."users_roles";

-- Now insert data
COPY public._pages_v (id, version_title, version_published_on, version_hero_type, version_hero_rich_text, version_slug, version_meta_title, version_meta_description, version_updated_at, version_created_at, version__status, created_at, updated_at, latest) FROM stdin;
3	Cart	2025-05-07 06:26:57.711+00	lowImpact	[{"type": "h1", "children": [{"text": "Cart"}]}, {"type": "p", "children": [{"text": "This cart saves to local storage so you can continue shopping later. Once you authenticate with Payload, your cart will sync to your user profile so you can continue shopping from any device. This hero and the content below the cart are completely dynamic and "}, {"url": "/admin", "type": "link", "children": [{"text": "configured in the admin dashboard"}], "linkType": "custom"}]}]	cart	Cart	Your cart will sync to your user profile so you can continue shopping from any device.	2025-05-07 06:26:59.241+00	2025-05-07 06:26:57.078+00	published	2025-05-07 06:26:57.078+00	2025-05-07 06:26:57.078+00	t
2	Home	2025-05-07 06:26:45.944+00	highImpact	[{"type": "h1", "children": [{"text": "Payload E-Commerce Store"}]}, {"type": "large-body", "children": [{"text": "Welcome to your store! "}, {"url": "/admin", "type": "link", "children": [{"text": "Visit the admin dashboard"}], "linkType": "custom"}, {"text": " to begin managing this site's content. The code for this template is completely open-source and can be found "}, {"url": "https://github.com/payloadcms/payload/tree/main/templates/ecommerce", "type": "link", "newTab": true, "children": [{"text": "here"}], "linkType": "custom"}, {"text": "."}]}]	home	Payload E-Commerce Template	An open-source e-commerce store built with Payload and Next.js.	2025-05-07 06:26:48.682+00	2025-05-07 06:26:45.307+00	published	2025-05-07 06:26:45.307+00	2025-05-07 06:26:45.307+00	f
1	Products	2025-05-07 06:26:39.214+00	lowImpact	[{"type": "h1", "children": [{"text": "All products"}]}, {"type": "p", "children": [{"text": "This page displays all or some of the products of your store ranging from goods and services to digital assets and gated content. Each product is complete with a dynamic page layout builder for a completely custom shopping experience that is under your full control."}]}]	products	Shop all products	Shop everything from goods and services to digital assets and gated content.	2025-05-07 06:26:40.537+00	2025-05-07 06:26:38.58+00	published	2025-05-07 06:26:38.58+00	2025-05-07 06:26:38.58+00	f
6	Home	2025-05-07 06:26:45.944+00	customHero	[{"type": "large-body", "children": [{"bold": true, "text": "Welcome to Kikky Art Studio"}, {"text": "\\n\\nYour creative partner in transforming spaces and expressions. We specialize in canvas paintings, tattoo artistry, tattoo supplies, and painting shop décor. Whether you're looking to enhance your space or express your identity through ink, Kikky Art Studio brings bold ideas to life with style and precision.\\n\\n"}]}]	home	Payload E-Commerce Template	An open-source e-commerce store built with Payload and Next.js.	2025-05-08 00:11:35.195+00	2025-05-08 00:10:27.463+00	published	2025-05-08 00:11:32.516+00	2025-05-08 00:11:32.516+00	f
7	Home	2025-05-07 06:26:45.944+00	customHero	[{"type": "h3", "children": [{"bold": true, "text": "Welcome to "}]}, {"type": "large-body", "children": [{"bold": true, "text": "Kikky Art Studio"}, {"text": "\\n\\nYour creative partner in transforming spaces and expressions. \\n\\n"}]}]	home	My Store	An open-source e-commerce store built with Payload and Next.js.	2025-05-08 00:27:57.799+00	2025-05-08 00:11:32.516+00	published	2025-05-08 00:27:55.16+00	2025-05-08 00:27:55.16+00	f
8	Home	2025-05-07 06:26:45.944+00	customHero	[{"type": "h3", "children": [{"bold": true, "text": "Welcome to "}]}, {"type": "large-body", "children": [{"bold": true, "text": "Kikky Art Studio"}, {"text": "\\n\\nYour creative partner in transforming spaces and expressions. \\n\\n"}]}]	home	My Store	An open-source e-commerce store built with Payload and Next.js.	2025-05-08 00:31:17.484+00	2025-05-08 00:27:55.16+00	published	2025-05-08 00:31:14.208+00	2025-05-08 00:31:14.208+00	f
9	Home	2025-05-07 06:26:45.944+00	customHero	[{"type": "h3", "children": [{"bold": true, "text": "Welcome to "}]}, {"type": "large-body", "children": [{"bold": true, "text": "Kikky Art Studio"}]}, {"type": "large-body", "children": [{"text": "Your creative partner in "}]}, {"type": "large-body", "children": [{"text": "transforming spaces and expressions. \\n\\n"}]}]	home	My Store	An open-source e-commerce store built with Payload and Next.js.	2025-05-08 00:32:18.757+00	2025-05-08 00:31:14.208+00	draft	2025-05-08 00:32:19.61+00	2025-05-08 00:32:19.61+00	f
10	Home	2025-05-07 06:26:45.944+00	customHero	[{"type": "h3", "children": [{"bold": true, "text": "Welcome to "}]}, {"type": "large-body", "children": [{"bold": true, "text": "Kikky Art Studio"}]}, {"type": "large-body", "children": [{"text": "Your creative partner in "}]}, {"type": "large-body", "children": [{"text": "transforming spaces and expressions. \\n\\n"}]}]	home	My Store	An open-source e-commerce store built with Payload and Next.js.	2025-05-08 00:32:34.305+00	2025-05-08 00:32:19.61+00	published	2025-05-08 00:32:31.445+00	2025-05-08 00:32:31.445+00	f
5	Home	2025-05-07 06:26:45.944+00	customHero	[{"type": "large-body", "children": [{"bold": true, "text": "Welcome to Kikky Art Studio"}, {"text": "\\n\\nYour creative partner in transforming spaces and expressions. We specialize in canvas paintings, tattoo artistry, tattoo supplies, and painting shop décor. Whether you're looking to enhance your space or express your identity through ink, Kikky Art Studio brings bold ideas to life with style and precision.\\n\\n"}]}]	home	Payload E-Commerce Template	An open-source e-commerce store built with Payload and Next.js.	2025-05-08 00:10:30.133+00	2025-05-07 23:50:24.31+00	published	2025-05-08 00:10:27.463+00	2025-05-08 00:10:27.463+00	f
11	Home	2025-05-07 06:26:45.944+00	customHero	[{"type": "h3", "children": [{"bold": true, "text": "Welcome to "}]}, {"type": "large-body", "children": [{"bold": true, "text": "Kikky Art Studio"}]}, {"type": "large-body", "children": [{"text": "Your creative partner in "}]}, {"type": "large-body", "children": [{"text": "transforming spaces and expressions. \\n\\n"}]}]	home	My Store	An open-source e-commerce store built with Payload and Next.js.	2025-05-08 00:33:50.777+00	2025-05-08 00:32:31.445+00	published	2025-05-08 00:33:47.873+00	2025-05-08 00:33:47.873+00	f
12	Home	2025-05-07 06:26:45.944+00	customHero	[{"type": "h3", "children": [{"bold": true, "text": "Welcome to "}]}, {"type": "large-body", "children": [{"bold": true, "text": "Kikky Art Studio"}]}, {"type": "large-body", "children": [{"text": "Your creative partner in "}]}, {"type": "large-body", "children": [{"text": "transforming spaces and expressions. \\n\\n"}]}]	home	My Store	An open-source e-commerce store built with Payload and Next.js.	2025-05-08 00:36:02.966+00	2025-05-08 00:33:47.873+00	published	2025-05-08 00:36:00.394+00	2025-05-08 00:36:00.394+00	t
4	Home	2025-05-07 06:26:45.944+00	mediumImpact	[{"type": "h1", "children": [{"text": "Payload E-Commerce Store"}]}, {"type": "large-body", "children": [{"text": "Welcome to your store! "}, {"url": "/admin", "type": "link", "children": [{"text": "Visit the admin dashboard"}], "linkType": "custom"}, {"text": " to begin managing this site's content. The code for this template is completely open-source and can be found "}, {"url": "https://github.com/payloadcms/payload/tree/main/templates/ecommerce", "type": "link", "newTab": true, "children": [{"text": "here"}], "linkType": "custom"}, {"text": "."}]}]	home	Payload E-Commerce Template	An open-source e-commerce store built with Payload and Next.js.	2025-05-07 23:50:27.025+00	2025-05-07 06:26:45.307+00	published	2025-05-07 23:50:24.31+00	2025-05-07 23:50:24.31+00	f
16	Products	2025-05-07 06:26:39.214+00	lowImpact	[{"type": "p", "children": [{"text": "From premium tattoo supplies to custom canvas paintings, Kikky Art Studio brings you quality tools and creative pieces designed to inspire every artist and collector.\\n\\n"}]}]	products	Kikky art studio - Explore Our Art & Tattoo Essentials	From premium tattoo supplies to custom canvas paintings, Kikky Art Studio brings you quality tools and creative pieces .	2025-05-08 13:17:57.544+00	2025-05-08 13:16:55.957+00	published	2025-05-08 13:17:55.676+00	2025-05-08 13:17:55.676+00	t
15	Products	2025-05-07 06:26:39.214+00	lowImpact	[{"type": "p", "children": [{"text": "From premium tattoo supplies to custom canvas paintings, Kikky Art Studio brings you quality tools and creative pieces designed to inspire every artist and collector.\\n\\n"}]}]	products	Kikky art studio - Explore Our Art & Tattoo Essentials	From premium tattoo supplies to custom canvas paintings, Kikky Art Studio brings you quality tools and creative pieces .	2025-05-08 13:16:57.848+00	2025-05-08 13:06:40.041+00	published	2025-05-08 13:16:55.957+00	2025-05-08 13:16:55.957+00	f
14	Products	2025-05-07 06:26:39.214+00	lowImpact	[{"type": "p", "children": [{"text": "From premium tattoo supplies to custom canvas paintings, Kikky Art Studio brings you quality tools and creative pieces designed to inspire every artist and collector.\\n\\n"}]}]	products	Kikky art studio - Explore Our Art & Tattoo Essentials	From premium tattoo supplies to custom canvas paintings, Kikky Art Studio brings you quality tools and creative pieces .	2025-05-08 13:13:03.418+00	2025-05-08 13:06:40.041+00	published	2025-05-08 13:12:59.367+00	2025-05-08 13:12:59.367+00	f
13	Products	2025-05-07 06:26:39.214+00	lowImpact	[{"type": "p", "children": [{"text": ""}]}]	products	Shop all products	Shop everything from goods and services to digital assets and gated content.	2025-05-08 13:06:42.18+00	2025-05-07 06:26:38.58+00	published	2025-05-08 13:06:40.041+00	2025-05-08 13:06:40.041+00	f
\.
COPY public._pages_v_blocks_archive (_order, _parent_id, _path, id, intro_content, "populateBy", "relationTo", "limit", populated_docs_total, _uuid, block_name) FROM stdin;
1	1	version.layout	1	[{"type": "h4", "children": [{"text": "All products"}]}, {"type": "p", "children": [{"text": "The products below are displayed in an \\"Archive\\" layout building block which is an extremely powerful way to display docs on a page. It can be auto-populated by collection, filtered by category, and much more."}]}]	collection	products	10	\N	681afd1f763e6d41b42832ed	Archive Block
3	2	version.layout	2	[{"type": "h4", "children": [{"text": "Recent Products"}]}, {"type": "p", "children": [{"text": "The products below are displayed in an \\"Archive\\" layout building block which is an extremely powerful way to display documents on a page. It can be auto-populated by collection or by category, or products can be individually selected. Pagination controls will automatically appear if the number of results exceeds the number of items per page."}]}]	collection	products	10	\N	681afd25763e6d41b42832f0	Archive Block
3	4	version.layout	3	[{"type": "h4", "children": [{"text": "Recent Products"}]}, {"type": "p", "children": [{"text": "The products below are displayed in an \\"Archive\\" layout building block which is an extremely powerful way to display documents on a page. It can be auto-populated by collection or by category, or products can be individually selected. Pagination controls will automatically appear if the number of results exceeds the number of items per page."}]}]	collection	products	10	\N	681afd25763e6d41b42832f0	Archive Block
3	5	version.layout	4	[{"type": "h4", "children": [{"text": "Recent Products"}]}, {"type": "p", "children": [{"text": "The products below are displayed in an \\"Archive\\" layout building block which is an extremely powerful way to display documents on a page. It can be auto-populated by collection or by category, or products can be individually selected. Pagination controls will automatically appear if the number of results exceeds the number of items per page."}]}]	collection	products	10	\N	681afd25763e6d41b42832f0	Archive Block
3	6	version.layout	5	[{"type": "h4", "children": [{"text": "Recent Products"}]}, {"type": "p", "children": [{"text": "The products below are displayed in an \\"Archive\\" layout building block which is an extremely powerful way to display documents on a page. It can be auto-populated by collection or by category, or products can be individually selected. Pagination controls will automatically appear if the number of results exceeds the number of items per page."}]}]	collection	products	10	\N	681afd25763e6d41b42832f0	Archive Block
3	7	version.layout	6	[{"type": "h4", "children": [{"text": "Recent Products"}]}, {"type": "p", "children": [{"text": "The products below are displayed in an \\"Archive\\" layout building block which is an extremely powerful way to display documents on a page. It can be auto-populated by collection or by category, or products can be individually selected. Pagination controls will automatically appear if the number of results exceeds the number of items per page."}]}]	collection	products	10	\N	681afd25763e6d41b42832f0	Archive Block
3	8	version.layout	7	[{"type": "h4", "children": [{"text": "Recent Products"}]}, {"type": "p", "children": [{"text": "The products below are displayed in an \\"Archive\\" layout building block which is an extremely powerful way to display documents on a page. It can be auto-populated by collection or by category, or products can be individually selected. Pagination controls will automatically appear if the number of results exceeds the number of items per page."}]}]	collection	products	10	\N	681afd25763e6d41b42832f0	Archive Block
3	9	version.layout	8	[{"type": "h4", "children": [{"text": "Recent Products"}]}, {"type": "p", "children": [{"text": "The products below are displayed in an \\"Archive\\" layout building block which is an extremely powerful way to display documents on a page. It can be auto-populated by collection or by category, or products can be individually selected. Pagination controls will automatically appear if the number of results exceeds the number of items per page."}]}]	collection	products	10	\N	681afd25763e6d41b42832f0	Archive Block
3	10	version.layout	9	[{"type": "h4", "children": [{"text": "Recent Products"}]}, {"type": "p", "children": [{"text": "The products below are displayed in an \\"Archive\\" layout building block which is an extremely powerful way to display documents on a page. It can be auto-populated by collection or by category, or products can be individually selected. Pagination controls will automatically appear if the number of results exceeds the number of items per page."}]}]	collection	products	10	\N	681afd25763e6d41b42832f0	Archive Block
3	11	version.layout	10	[{"type": "h4", "children": [{"text": "Recent Products"}]}, {"type": "p", "children": [{"text": "The products below are displayed in an \\"Archive\\" layout building block which is an extremely powerful way to display documents on a page. It can be auto-populated by collection or by category, or products can be individually selected. Pagination controls will automatically appear if the number of results exceeds the number of items per page."}]}]	collection	products	10	\N	681afd25763e6d41b42832f0	Archive Block
3	12	version.layout	11	[{"type": "h4", "children": [{"text": "Recent Products"}]}, {"type": "p", "children": [{"text": "The products below are displayed in an \\"Archive\\" layout building block which is an extremely powerful way to display documents on a page. It can be auto-populated by collection or by category, or products can be individually selected. Pagination controls will automatically appear if the number of results exceeds the number of items per page."}]}]	collection	products	10	\N	681afd25763e6d41b42832f0	Archive Block
1	13	version.layout	12	[{"type": "h4", "children": [{"text": "All products"}]}, {"type": "p", "children": [{"text": "The products below are displayed in an \\"Archive\\" layout building block which is an extremely powerful way to display docs on a page. It can be auto-populated by collection, filtered by category, and much more."}]}]	collection	products	10	\N	681afd1f763e6d41b42832ed	Archive Block
1	14	version.layout	13	[{"type": "h4", "children": [{"text": "All products"}]}, {"type": "p", "children": [{"text": "The products below are displayed in an \\"Archive\\" layout building block which is an extremely powerful way to display docs on a page. It can be auto-populated by collection, filtered by category, and much more."}]}]	collection	products	10	\N	681afd1f763e6d41b42832ed	Archive Block
1	15	version.layout	14	[{"type": "p", "children": [{"text": ""}]}]	collection	products	10	\N	681afd1f763e6d41b42832ed	Archive Block
1	16	version.layout	15	[{"type": "p", "children": [{"text": "From premium tattoo supplies to custom canvas paintings, Kikky Art Studio brings you quality tools and creative pieces designed to inspire every artist and collector."}]}]	collection	products	10	\N	681afd1f763e6d41b42832ed	Archive Block
\.
COPY public._pages_v_blocks_content (_order, _parent_id, _path, id, invert_background, _uuid, block_name) FROM stdin;
1	2	version.layout	1	\N	681afd25763e6d41b42832ee	Content Block
1	3	version.layout	2	\N	681afd31763e6d41b42832ff	\N
1	4	version.layout	3	\N	681afd25763e6d41b42832ee	Content Block
1	5	version.layout	4	\N	681afd25763e6d41b42832ee	Content Block
1	6	version.layout	5	\N	681afd25763e6d41b42832ee	Content Block
1	7	version.layout	6	\N	681afd25763e6d41b42832ee	Content Block
1	8	version.layout	7	\N	681afd25763e6d41b42832ee	Content Block
1	9	version.layout	8	\N	681afd25763e6d41b42832ee	Content Block
1	10	version.layout	9	\N	681afd25763e6d41b42832ee	Content Block
1	11	version.layout	10	\N	681afd25763e6d41b42832ee	Content Block
1	12	version.layout	11	\N	681afd25763e6d41b42832ee	Content Block
\.
COPY public._pages_v_blocks_content_columns (_order, _parent_id, id, size, rich_text, enable_link, link_type, link_new_tab, link_url, link_label, link_appearance, _uuid) FROM stdin;
1	1	1	full	[{"type": "h2", "children": [{"text": "Core Features"}]}, {"children": [{"text": ""}]}]	\N	reference	\N	\N	\N	default	681afd25763e6d41b42832f4
2	1	2	oneThird	[{"type": "h3", "children": [{"text": "Admin Dashboard"}]}, {"children": [{"text": "Manage this site's users, pages, products, and more from the "}, {"url": "/admin", "type": "link", "children": [{"text": "admin dashboard"}], "linkType": "custom"}, {"text": "."}]}]	f	reference	\N			default	681afd25763e6d41b42832f5
3	1	3	oneThird	[{"type": "h3", "children": [{"text": "Authentication"}]}, {"children": [{"text": "User "}, {"url": "/login", "type": "link", "children": [{"text": "login"}], "linkType": "custom"}, {"text": " and "}, {"url": "/create-account", "type": "link", "children": [{"text": "create account"}], "linkType": "custom"}, {"text": " flows are complete with email verification and password reset."}]}]	f	reference	\N			default	681afd25763e6d41b42832f6
4	1	4	oneThird	[{"type": "h3", "children": [{"text": "Customer Accounts"}]}, {"children": [{"text": "Customers can "}, {"url": "/account", "type": "link", "children": [{"text": "manage their account"}], "linkType": "custom"}, {"text": ", "}, {"url": "/orders", "type": "link", "children": [{"text": "view their order history"}], "linkType": "custom"}, {"text": ", and more without leaving the site."}]}]	f	reference	\N			default	681afd25763e6d41b42832f7
5	1	5	oneThird	[{"type": "h3", "children": [{"text": "Paywall"}]}, {"children": [{"text": "Easily gate digital content behind a paywall or require users to be logged in to access it."}]}]	f	reference	\N			default	681afd25763e6d41b42832f8
6	1	6	oneThird	[{"type": "h3", "children": [{"text": "Shopping Cart"}]}, {"children": [{"text": "Shopping carts persist between sessions, can be saved for later, and are accessible from any device."}]}]	f	reference	\N			default	681afd25763e6d41b42832f9
7	1	7	oneThird	[{"type": "h3", "children": [{"text": "Checkout"}]}, {"children": [{"text": "Secure in-app checkout powered by Stripe means your customers never have to leave your site."}]}]	f	reference	\N			default	681afd25763e6d41b42832fa
8	1	8	oneThird	[{"type": "h3", "children": [{"text": "Page Builder"}]}, {"children": [{"text": "Custom page builder allows you to create unique page and product layouts for any type of content."}]}]	f	reference	\N			default	681afd25763e6d41b42832fb
9	1	9	oneThird	[{"type": "h3", "children": [{"text": "SEO"}]}, {"children": [{"text": "Editors have complete control over SEO data and site content directly from the "}, {"url": "/admin", "type": "link", "children": [{"text": "admin dashboard"}], "linkType": "custom"}, {"text": "."}]}]	f	reference	\N			default	681afd25763e6d41b42832fc
10	1	10	oneThird	[{"type": "h3", "children": [{"text": "Dark Mode"}]}, {"children": [{"text": "Users will experience this site in their preferred color scheme, and each block can be inverted."}]}]	f	reference	\N			default	681afd25763e6d41b42832fd
1	2	11	twoThirds	[{"children": [{"text": "This is a custom layout building block configurable in the CMS—this can be anything you want. Related or suggested products, a blog post, video, etc."}]}]	\N	reference	\N			default	681afd31763e6d41b4283301
1	3	12	full	[{"type": "h2", "children": [{"text": "Core Features"}]}, {"children": [{"text": ""}]}]	\N	reference	\N	\N	\N	default	681afd25763e6d41b42832f4
2	3	13	oneThird	[{"type": "h3", "children": [{"text": "Admin Dashboard"}]}, {"children": [{"text": "Manage this site's users, pages, products, and more from the "}, {"url": "/admin", "type": "link", "children": [{"text": "admin dashboard"}], "linkType": "custom"}, {"text": "."}]}]	f	reference	\N			default	681afd25763e6d41b42832f5
3	3	14	oneThird	[{"type": "h3", "children": [{"text": "Authentication"}]}, {"children": [{"text": "User "}, {"url": "/login", "type": "link", "children": [{"text": "login"}], "linkType": "custom"}, {"text": " and "}, {"url": "/create-account", "type": "link", "children": [{"text": "create account"}], "linkType": "custom"}, {"text": " flows are complete with email verification and password reset."}]}]	f	reference	\N			default	681afd25763e6d41b42832f6
4	3	15	oneThird	[{"type": "h3", "children": [{"text": "Customer Accounts"}]}, {"children": [{"text": "Customers can "}, {"url": "/account", "type": "link", "children": [{"text": "manage their account"}], "linkType": "custom"}, {"text": ", "}, {"url": "/orders", "type": "link", "children": [{"text": "view their order history"}], "linkType": "custom"}, {"text": ", and more without leaving the site."}]}]	f	reference	\N			default	681afd25763e6d41b42832f7
5	3	16	oneThird	[{"type": "h3", "children": [{"text": "Paywall"}]}, {"children": [{"text": "Easily gate digital content behind a paywall or require users to be logged in to access it."}]}]	f	reference	\N			default	681afd25763e6d41b42832f8
6	3	17	oneThird	[{"type": "h3", "children": [{"text": "Shopping Cart"}]}, {"children": [{"text": "Shopping carts persist between sessions, can be saved for later, and are accessible from any device."}]}]	f	reference	\N			default	681afd25763e6d41b42832f9
7	3	18	oneThird	[{"type": "h3", "children": [{"text": "Checkout"}]}, {"children": [{"text": "Secure in-app checkout powered by Stripe means your customers never have to leave your site."}]}]	f	reference	\N			default	681afd25763e6d41b42832fa
8	3	19	oneThird	[{"type": "h3", "children": [{"text": "Page Builder"}]}, {"children": [{"text": "Custom page builder allows you to create unique page and product layouts for any type of content."}]}]	f	reference	\N			default	681afd25763e6d41b42832fb
9	3	20	oneThird	[{"type": "h3", "children": [{"text": "SEO"}]}, {"children": [{"text": "Editors have complete control over SEO data and site content directly from the "}, {"url": "/admin", "type": "link", "children": [{"text": "admin dashboard"}], "linkType": "custom"}, {"text": "."}]}]	f	reference	\N			default	681afd25763e6d41b42832fc
10	3	21	oneThird	[{"type": "h3", "children": [{"text": "Dark Mode"}]}, {"children": [{"text": "Users will experience this site in their preferred color scheme, and each block can be inverted."}]}]	f	reference	\N			default	681afd25763e6d41b42832fd
1	4	22	full	[{"type": "h2", "children": [{"text": "Core Features"}]}, {"children": [{"text": ""}]}]	\N	reference	\N	\N	\N	default	681afd25763e6d41b42832f4
2	4	23	oneThird	[{"type": "h3", "children": [{"text": "Admin Dashboard"}]}, {"children": [{"text": "Manage this site's users, pages, products, and more from the "}, {"url": "/admin", "type": "link", "children": [{"text": "admin dashboard"}], "linkType": "custom"}, {"text": "."}]}]	f	reference	\N			default	681afd25763e6d41b42832f5
3	4	24	oneThird	[{"type": "h3", "children": [{"text": "Authentication"}]}, {"children": [{"text": "User "}, {"url": "/login", "type": "link", "children": [{"text": "login"}], "linkType": "custom"}, {"text": " and "}, {"url": "/create-account", "type": "link", "children": [{"text": "create account"}], "linkType": "custom"}, {"text": " flows are complete with email verification and password reset."}]}]	f	reference	\N			default	681afd25763e6d41b42832f6
4	4	25	oneThird	[{"type": "h3", "children": [{"text": "Customer Accounts"}]}, {"children": [{"text": "Customers can "}, {"url": "/account", "type": "link", "children": [{"text": "manage their account"}], "linkType": "custom"}, {"text": ", "}, {"url": "/orders", "type": "link", "children": [{"text": "view their order history"}], "linkType": "custom"}, {"text": ", and more without leaving the site."}]}]	f	reference	\N			default	681afd25763e6d41b42832f7
5	4	26	oneThird	[{"type": "h3", "children": [{"text": "Paywall"}]}, {"children": [{"text": "Easily gate digital content behind a paywall or require users to be logged in to access it."}]}]	f	reference	\N			default	681afd25763e6d41b42832f8
6	4	27	oneThird	[{"type": "h3", "children": [{"text": "Shopping Cart"}]}, {"children": [{"text": "Shopping carts persist between sessions, can be saved for later, and are accessible from any device."}]}]	f	reference	\N			default	681afd25763e6d41b42832f9
7	4	28	oneThird	[{"type": "h3", "children": [{"text": "Checkout"}]}, {"children": [{"text": "Secure in-app checkout powered by Stripe means your customers never have to leave your site."}]}]	f	reference	\N			default	681afd25763e6d41b42832fa
8	4	29	oneThird	[{"type": "h3", "children": [{"text": "Page Builder"}]}, {"children": [{"text": "Custom page builder allows you to create unique page and product layouts for any type of content."}]}]	f	reference	\N			default	681afd25763e6d41b42832fb
9	4	30	oneThird	[{"type": "h3", "children": [{"text": "SEO"}]}, {"children": [{"text": "Editors have complete control over SEO data and site content directly from the "}, {"url": "/admin", "type": "link", "children": [{"text": "admin dashboard"}], "linkType": "custom"}, {"text": "."}]}]	f	reference	\N			default	681afd25763e6d41b42832fc
10	4	31	oneThird	[{"type": "h3", "children": [{"text": "Dark Mode"}]}, {"children": [{"text": "Users will experience this site in their preferred color scheme, and each block can be inverted."}]}]	f	reference	\N			default	681afd25763e6d41b42832fd
1	5	32	full	[{"type": "h2", "children": [{"text": "Core Features"}]}, {"children": [{"text": ""}]}]	\N	reference	\N	\N	\N	default	681afd25763e6d41b42832f4
2	5	33	oneThird	[{"type": "h3", "children": [{"text": "Admin Dashboard"}]}, {"children": [{"text": "Manage this site's users, pages, products, and more from the "}, {"url": "/admin", "type": "link", "children": [{"text": "admin dashboard"}], "linkType": "custom"}, {"text": "."}]}]	f	reference	\N			default	681afd25763e6d41b42832f5
3	5	34	oneThird	[{"type": "h3", "children": [{"text": "Authentication"}]}, {"children": [{"text": "User "}, {"url": "/login", "type": "link", "children": [{"text": "login"}], "linkType": "custom"}, {"text": " and "}, {"url": "/create-account", "type": "link", "children": [{"text": "create account"}], "linkType": "custom"}, {"text": " flows are complete with email verification and password reset."}]}]	f	reference	\N			default	681afd25763e6d41b42832f6
4	5	35	oneThird	[{"type": "h3", "children": [{"text": "Customer Accounts"}]}, {"children": [{"text": "Customers can "}, {"url": "/account", "type": "link", "children": [{"text": "manage their account"}], "linkType": "custom"}, {"text": ", "}, {"url": "/orders", "type": "link", "children": [{"text": "view their order history"}], "linkType": "custom"}, {"text": ", and more without leaving the site."}]}]	f	reference	\N			default	681afd25763e6d41b42832f7
5	5	36	oneThird	[{"type": "h3", "children": [{"text": "Paywall"}]}, {"children": [{"text": "Easily gate digital content behind a paywall or require users to be logged in to access it."}]}]	f	reference	\N			default	681afd25763e6d41b42832f8
6	5	37	oneThird	[{"type": "h3", "children": [{"text": "Shopping Cart"}]}, {"children": [{"text": "Shopping carts persist between sessions, can be saved for later, and are accessible from any device."}]}]	f	reference	\N			default	681afd25763e6d41b42832f9
7	5	38	oneThird	[{"type": "h3", "children": [{"text": "Checkout"}]}, {"children": [{"text": "Secure in-app checkout powered by Stripe means your customers never have to leave your site."}]}]	f	reference	\N			default	681afd25763e6d41b42832fa
8	5	39	oneThird	[{"type": "h3", "children": [{"text": "Page Builder"}]}, {"children": [{"text": "Custom page builder allows you to create unique page and product layouts for any type of content."}]}]	f	reference	\N			default	681afd25763e6d41b42832fb
9	5	40	oneThird	[{"type": "h3", "children": [{"text": "SEO"}]}, {"children": [{"text": "Editors have complete control over SEO data and site content directly from the "}, {"url": "/admin", "type": "link", "children": [{"text": "admin dashboard"}], "linkType": "custom"}, {"text": "."}]}]	f	reference	\N			default	681afd25763e6d41b42832fc
10	5	41	oneThird	[{"type": "h3", "children": [{"text": "Dark Mode"}]}, {"children": [{"text": "Users will experience this site in their preferred color scheme, and each block can be inverted."}]}]	f	reference	\N			default	681afd25763e6d41b42832fd
1	6	42	full	[{"type": "h2", "children": [{"text": "Core Features"}]}, {"children": [{"text": ""}]}]	\N	reference	\N	\N	\N	default	681afd25763e6d41b42832f4
2	6	43	oneThird	[{"type": "h3", "children": [{"text": "Admin Dashboard"}]}, {"children": [{"text": "Manage this site's users, pages, products, and more from the "}, {"url": "/admin", "type": "link", "children": [{"text": "admin dashboard"}], "linkType": "custom"}, {"text": "."}]}]	f	reference	\N			default	681afd25763e6d41b42832f5
3	6	44	oneThird	[{"type": "h3", "children": [{"text": "Authentication"}]}, {"children": [{"text": "User "}, {"url": "/login", "type": "link", "children": [{"text": "login"}], "linkType": "custom"}, {"text": " and "}, {"url": "/create-account", "type": "link", "children": [{"text": "create account"}], "linkType": "custom"}, {"text": " flows are complete with email verification and password reset."}]}]	f	reference	\N			default	681afd25763e6d41b42832f6
4	6	45	oneThird	[{"type": "h3", "children": [{"text": "Customer Accounts"}]}, {"children": [{"text": "Customers can "}, {"url": "/account", "type": "link", "children": [{"text": "manage their account"}], "linkType": "custom"}, {"text": ", "}, {"url": "/orders", "type": "link", "children": [{"text": "view their order history"}], "linkType": "custom"}, {"text": ", and more without leaving the site."}]}]	f	reference	\N			default	681afd25763e6d41b42832f7
5	6	46	oneThird	[{"type": "h3", "children": [{"text": "Paywall"}]}, {"children": [{"text": "Easily gate digital content behind a paywall or require users to be logged in to access it."}]}]	f	reference	\N			default	681afd25763e6d41b42832f8
6	6	47	oneThird	[{"type": "h3", "children": [{"text": "Shopping Cart"}]}, {"children": [{"text": "Shopping carts persist between sessions, can be saved for later, and are accessible from any device."}]}]	f	reference	\N			default	681afd25763e6d41b42832f9
7	6	48	oneThird	[{"type": "h3", "children": [{"text": "Checkout"}]}, {"children": [{"text": "Secure in-app checkout powered by Stripe means your customers never have to leave your site."}]}]	f	reference	\N			default	681afd25763e6d41b42832fa
8	6	49	oneThird	[{"type": "h3", "children": [{"text": "Page Builder"}]}, {"children": [{"text": "Custom page builder allows you to create unique page and product layouts for any type of content."}]}]	f	reference	\N			default	681afd25763e6d41b42832fb
9	6	50	oneThird	[{"type": "h3", "children": [{"text": "SEO"}]}, {"children": [{"text": "Editors have complete control over SEO data and site content directly from the "}, {"url": "/admin", "type": "link", "children": [{"text": "admin dashboard"}], "linkType": "custom"}, {"text": "."}]}]	f	reference	\N			default	681afd25763e6d41b42832fc
10	6	51	oneThird	[{"type": "h3", "children": [{"text": "Dark Mode"}]}, {"children": [{"text": "Users will experience this site in their preferred color scheme, and each block can be inverted."}]}]	f	reference	\N			default	681afd25763e6d41b42832fd
1	7	52	full	[{"type": "h2", "children": [{"text": "Core Features"}]}, {"children": [{"text": ""}]}]	\N	reference	\N	\N	\N	default	681afd25763e6d41b42832f4
2	7	53	oneThird	[{"type": "h3", "children": [{"text": "Admin Dashboard"}]}, {"children": [{"text": "Manage this site's users, pages, products, and more from the "}, {"url": "/admin", "type": "link", "children": [{"text": "admin dashboard"}], "linkType": "custom"}, {"text": "."}]}]	f	reference	\N			default	681afd25763e6d41b42832f5
3	7	54	oneThird	[{"type": "h3", "children": [{"text": "Authentication"}]}, {"children": [{"text": "User "}, {"url": "/login", "type": "link", "children": [{"text": "login"}], "linkType": "custom"}, {"text": " and "}, {"url": "/create-account", "type": "link", "children": [{"text": "create account"}], "linkType": "custom"}, {"text": " flows are complete with email verification and password reset."}]}]	f	reference	\N			default	681afd25763e6d41b42832f6
4	7	55	oneThird	[{"type": "h3", "children": [{"text": "Customer Accounts"}]}, {"children": [{"text": "Customers can "}, {"url": "/account", "type": "link", "children": [{"text": "manage their account"}], "linkType": "custom"}, {"text": ", "}, {"url": "/orders", "type": "link", "children": [{"text": "view their order history"}], "linkType": "custom"}, {"text": ", and more without leaving the site."}]}]	f	reference	\N			default	681afd25763e6d41b42832f7
5	7	56	oneThird	[{"type": "h3", "children": [{"text": "Paywall"}]}, {"children": [{"text": "Easily gate digital content behind a paywall or require users to be logged in to access it."}]}]	f	reference	\N			default	681afd25763e6d41b42832f8
6	7	57	oneThird	[{"type": "h3", "children": [{"text": "Shopping Cart"}]}, {"children": [{"text": "Shopping carts persist between sessions, can be saved for later, and are accessible from any device."}]}]	f	reference	\N			default	681afd25763e6d41b42832f9
7	7	58	oneThird	[{"type": "h3", "children": [{"text": "Checkout"}]}, {"children": [{"text": "Secure in-app checkout powered by Stripe means your customers never have to leave your site."}]}]	f	reference	\N			default	681afd25763e6d41b42832fa
8	7	59	oneThird	[{"type": "h3", "children": [{"text": "Page Builder"}]}, {"children": [{"text": "Custom page builder allows you to create unique page and product layouts for any type of content."}]}]	f	reference	\N			default	681afd25763e6d41b42832fb
9	7	60	oneThird	[{"type": "h3", "children": [{"text": "SEO"}]}, {"children": [{"text": "Editors have complete control over SEO data and site content directly from the "}, {"url": "/admin", "type": "link", "children": [{"text": "admin dashboard"}], "linkType": "custom"}, {"text": "."}]}]	f	reference	\N			default	681afd25763e6d41b42832fc
10	7	61	oneThird	[{"type": "h3", "children": [{"text": "Dark Mode"}]}, {"children": [{"text": "Users will experience this site in their preferred color scheme, and each block can be inverted."}]}]	f	reference	\N			default	681afd25763e6d41b42832fd
1	8	62	full	[{"type": "h2", "children": [{"text": "Core Features"}]}, {"children": [{"text": ""}]}]	\N	reference	\N	\N	\N	default	681afd25763e6d41b42832f4
2	8	63	oneThird	[{"type": "h3", "children": [{"text": "Admin Dashboard"}]}, {"children": [{"text": "Manage this site's users, pages, products, and more from the "}, {"url": "/admin", "type": "link", "children": [{"text": "admin dashboard"}], "linkType": "custom"}, {"text": "."}]}]	f	reference	\N			default	681afd25763e6d41b42832f5
3	8	64	oneThird	[{"type": "h3", "children": [{"text": "Authentication"}]}, {"children": [{"text": "User "}, {"url": "/login", "type": "link", "children": [{"text": "login"}], "linkType": "custom"}, {"text": " and "}, {"url": "/create-account", "type": "link", "children": [{"text": "create account"}], "linkType": "custom"}, {"text": " flows are complete with email verification and password reset."}]}]	f	reference	\N			default	681afd25763e6d41b42832f6
4	8	65	oneThird	[{"type": "h3", "children": [{"text": "Customer Accounts"}]}, {"children": [{"text": "Customers can "}, {"url": "/account", "type": "link", "children": [{"text": "manage their account"}], "linkType": "custom"}, {"text": ", "}, {"url": "/orders", "type": "link", "children": [{"text": "view their order history"}], "linkType": "custom"}, {"text": ", and more without leaving the site."}]}]	f	reference	\N			default	681afd25763e6d41b42832f7
5	8	66	oneThird	[{"type": "h3", "children": [{"text": "Paywall"}]}, {"children": [{"text": "Easily gate digital content behind a paywall or require users to be logged in to access it."}]}]	f	reference	\N			default	681afd25763e6d41b42832f8
6	8	67	oneThird	[{"type": "h3", "children": [{"text": "Shopping Cart"}]}, {"children": [{"text": "Shopping carts persist between sessions, can be saved for later, and are accessible from any device."}]}]	f	reference	\N			default	681afd25763e6d41b42832f9
7	8	68	oneThird	[{"type": "h3", "children": [{"text": "Checkout"}]}, {"children": [{"text": "Secure in-app checkout powered by Stripe means your customers never have to leave your site."}]}]	f	reference	\N			default	681afd25763e6d41b42832fa
8	8	69	oneThird	[{"type": "h3", "children": [{"text": "Page Builder"}]}, {"children": [{"text": "Custom page builder allows you to create unique page and product layouts for any type of content."}]}]	f	reference	\N			default	681afd25763e6d41b42832fb
9	8	70	oneThird	[{"type": "h3", "children": [{"text": "SEO"}]}, {"children": [{"text": "Editors have complete control over SEO data and site content directly from the "}, {"url": "/admin", "type": "link", "children": [{"text": "admin dashboard"}], "linkType": "custom"}, {"text": "."}]}]	f	reference	\N			default	681afd25763e6d41b42832fc
10	8	71	oneThird	[{"type": "h3", "children": [{"text": "Dark Mode"}]}, {"children": [{"text": "Users will experience this site in their preferred color scheme, and each block can be inverted."}]}]	f	reference	\N			default	681afd25763e6d41b42832fd
1	9	72	full	[{"type": "h2", "children": [{"text": "Core Features"}]}, {"children": [{"text": ""}]}]	\N	reference	\N	\N	\N	default	681afd25763e6d41b42832f4
2	9	73	oneThird	[{"type": "h3", "children": [{"text": "Admin Dashboard"}]}, {"children": [{"text": "Manage this site's users, pages, products, and more from the "}, {"url": "/admin", "type": "link", "children": [{"text": "admin dashboard"}], "linkType": "custom"}, {"text": "."}]}]	f	reference	\N			default	681afd25763e6d41b42832f5
3	9	74	oneThird	[{"type": "h3", "children": [{"text": "Authentication"}]}, {"children": [{"text": "User "}, {"url": "/login", "type": "link", "children": [{"text": "login"}], "linkType": "custom"}, {"text": " and "}, {"url": "/create-account", "type": "link", "children": [{"text": "create account"}], "linkType": "custom"}, {"text": " flows are complete with email verification and password reset."}]}]	f	reference	\N			default	681afd25763e6d41b42832f6
4	9	75	oneThird	[{"type": "h3", "children": [{"text": "Customer Accounts"}]}, {"children": [{"text": "Customers can "}, {"url": "/account", "type": "link", "children": [{"text": "manage their account"}], "linkType": "custom"}, {"text": ", "}, {"url": "/orders", "type": "link", "children": [{"text": "view their order history"}], "linkType": "custom"}, {"text": ", and more without leaving the site."}]}]	f	reference	\N			default	681afd25763e6d41b42832f7
5	9	76	oneThird	[{"type": "h3", "children": [{"text": "Paywall"}]}, {"children": [{"text": "Easily gate digital content behind a paywall or require users to be logged in to access it."}]}]	f	reference	\N			default	681afd25763e6d41b42832f8
6	9	77	oneThird	[{"type": "h3", "children": [{"text": "Shopping Cart"}]}, {"children": [{"text": "Shopping carts persist between sessions, can be saved for later, and are accessible from any device."}]}]	f	reference	\N			default	681afd25763e6d41b42832f9
7	9	78	oneThird	[{"type": "h3", "children": [{"text": "Checkout"}]}, {"children": [{"text": "Secure in-app checkout powered by Stripe means your customers never have to leave your site."}]}]	f	reference	\N			default	681afd25763e6d41b42832fa
8	9	79	oneThird	[{"type": "h3", "children": [{"text": "Page Builder"}]}, {"children": [{"text": "Custom page builder allows you to create unique page and product layouts for any type of content."}]}]	f	reference	\N			default	681afd25763e6d41b42832fb
9	9	80	oneThird	[{"type": "h3", "children": [{"text": "SEO"}]}, {"children": [{"text": "Editors have complete control over SEO data and site content directly from the "}, {"url": "/admin", "type": "link", "children": [{"text": "admin dashboard"}], "linkType": "custom"}, {"text": "."}]}]	f	reference	\N			default	681afd25763e6d41b42832fc
10	9	81	oneThird	[{"type": "h3", "children": [{"text": "Dark Mode"}]}, {"children": [{"text": "Users will experience this site in their preferred color scheme, and each block can be inverted."}]}]	f	reference	\N			default	681afd25763e6d41b42832fd
1	10	82	full	[{"type": "h2", "children": [{"text": "Core Features"}]}, {"children": [{"text": ""}]}]	\N	reference	\N	\N	\N	default	681afd25763e6d41b42832f4
2	10	83	oneThird	[{"type": "h3", "children": [{"text": "Admin Dashboard"}]}, {"children": [{"text": "Manage this site's users, pages, products, and more from the "}, {"url": "/admin", "type": "link", "children": [{"text": "admin dashboard"}], "linkType": "custom"}, {"text": "."}]}]	f	reference	\N			default	681afd25763e6d41b42832f5
3	10	84	oneThird	[{"type": "h3", "children": [{"text": "Authentication"}]}, {"children": [{"text": "User "}, {"url": "/login", "type": "link", "children": [{"text": "login"}], "linkType": "custom"}, {"text": " and "}, {"url": "/create-account", "type": "link", "children": [{"text": "create account"}], "linkType": "custom"}, {"text": " flows are complete with email verification and password reset."}]}]	f	reference	\N			default	681afd25763e6d41b42832f6
4	10	85	oneThird	[{"type": "h3", "children": [{"text": "Customer Accounts"}]}, {"children": [{"text": "Customers can "}, {"url": "/account", "type": "link", "children": [{"text": "manage their account"}], "linkType": "custom"}, {"text": ", "}, {"url": "/orders", "type": "link", "children": [{"text": "view their order history"}], "linkType": "custom"}, {"text": ", and more without leaving the site."}]}]	f	reference	\N			default	681afd25763e6d41b42832f7
5	10	86	oneThird	[{"type": "h3", "children": [{"text": "Paywall"}]}, {"children": [{"text": "Easily gate digital content behind a paywall or require users to be logged in to access it."}]}]	f	reference	\N			default	681afd25763e6d41b42832f8
6	10	87	oneThird	[{"type": "h3", "children": [{"text": "Shopping Cart"}]}, {"children": [{"text": "Shopping carts persist between sessions, can be saved for later, and are accessible from any device."}]}]	f	reference	\N			default	681afd25763e6d41b42832f9
7	10	88	oneThird	[{"type": "h3", "children": [{"text": "Checkout"}]}, {"children": [{"text": "Secure in-app checkout powered by Stripe means your customers never have to leave your site."}]}]	f	reference	\N			default	681afd25763e6d41b42832fa
8	10	89	oneThird	[{"type": "h3", "children": [{"text": "Page Builder"}]}, {"children": [{"text": "Custom page builder allows you to create unique page and product layouts for any type of content."}]}]	f	reference	\N			default	681afd25763e6d41b42832fb
9	10	90	oneThird	[{"type": "h3", "children": [{"text": "SEO"}]}, {"children": [{"text": "Editors have complete control over SEO data and site content directly from the "}, {"url": "/admin", "type": "link", "children": [{"text": "admin dashboard"}], "linkType": "custom"}, {"text": "."}]}]	f	reference	\N			default	681afd25763e6d41b42832fc
10	10	91	oneThird	[{"type": "h3", "children": [{"text": "Dark Mode"}]}, {"children": [{"text": "Users will experience this site in their preferred color scheme, and each block can be inverted."}]}]	f	reference	\N			default	681afd25763e6d41b42832fd
1	11	92	full	[{"type": "h2", "children": [{"text": "Core Features"}]}, {"children": [{"text": ""}]}]	\N	reference	\N	\N	\N	default	681afd25763e6d41b42832f4
2	11	93	oneThird	[{"type": "h3", "children": [{"text": "Admin Dashboard"}]}, {"children": [{"text": "Manage this site's users, pages, products, and more from the "}, {"url": "/admin", "type": "link", "children": [{"text": "admin dashboard"}], "linkType": "custom"}, {"text": "."}]}]	f	reference	\N			default	681afd25763e6d41b42832f5
3	11	94	oneThird	[{"type": "h3", "children": [{"text": "Authentication"}]}, {"children": [{"text": "User "}, {"url": "/login", "type": "link", "children": [{"text": "login"}], "linkType": "custom"}, {"text": " and "}, {"url": "/create-account", "type": "link", "children": [{"text": "create account"}], "linkType": "custom"}, {"text": " flows are complete with email verification and password reset."}]}]	f	reference	\N			default	681afd25763e6d41b42832f6
4	11	95	oneThird	[{"type": "h3", "children": [{"text": "Customer Accounts"}]}, {"children": [{"text": "Customers can "}, {"url": "/account", "type": "link", "children": [{"text": "manage their account"}], "linkType": "custom"}, {"text": ", "}, {"url": "/orders", "type": "link", "children": [{"text": "view their order history"}], "linkType": "custom"}, {"text": ", and more without leaving the site."}]}]	f	reference	\N			default	681afd25763e6d41b42832f7
5	11	96	oneThird	[{"type": "h3", "children": [{"text": "Paywall"}]}, {"children": [{"text": "Easily gate digital content behind a paywall or require users to be logged in to access it."}]}]	f	reference	\N			default	681afd25763e6d41b42832f8
6	11	97	oneThird	[{"type": "h3", "children": [{"text": "Shopping Cart"}]}, {"children": [{"text": "Shopping carts persist between sessions, can be saved for later, and are accessible from any device."}]}]	f	reference	\N			default	681afd25763e6d41b42832f9
7	11	98	oneThird	[{"type": "h3", "children": [{"text": "Checkout"}]}, {"children": [{"text": "Secure in-app checkout powered by Stripe means your customers never have to leave your site."}]}]	f	reference	\N			default	681afd25763e6d41b42832fa
8	11	99	oneThird	[{"type": "h3", "children": [{"text": "Page Builder"}]}, {"children": [{"text": "Custom page builder allows you to create unique page and product layouts for any type of content."}]}]	f	reference	\N			default	681afd25763e6d41b42832fb
9	11	100	oneThird	[{"type": "h3", "children": [{"text": "SEO"}]}, {"children": [{"text": "Editors have complete control over SEO data and site content directly from the "}, {"url": "/admin", "type": "link", "children": [{"text": "admin dashboard"}], "linkType": "custom"}, {"text": "."}]}]	f	reference	\N			default	681afd25763e6d41b42832fc
10	11	101	oneThird	[{"type": "h3", "children": [{"text": "Dark Mode"}]}, {"children": [{"text": "Users will experience this site in their preferred color scheme, and each block can be inverted."}]}]	f	reference	\N			default	681afd25763e6d41b42832fd
\.
COPY public._pages_v_blocks_cta (_order, _parent_id, _path, id, invert_background, rich_text, _uuid, block_name) FROM stdin;
4	2	version.layout	1	\N	[{"type": "h4", "children": [{"text": "Shop now"}]}, {"children": [{"text": "This is a custom layout building block "}, {"url": "/admin", "type": "link", "children": [{"text": "configured in the admin dashboard"}], "linkType": "custom"}, {"text": "."}]}]	681afd25763e6d41b42832f1	CTA
2	3	version.layout	2	\N	[{"type": "h4", "children": [{"text": "Continue shopping"}]}, {"children": [{"text": "This is a custom layout building block "}, {"url": "/admin", "type": "link", "children": [{"text": "configured in the admin dashboard"}], "linkType": "custom"}, {"text": "."}]}]	681afd31763e6d41b4283300	CTA
4	4	version.layout	3	\N	[{"type": "h4", "children": [{"text": "Shop now"}]}, {"children": [{"text": "This is a custom layout building block "}, {"url": "/admin", "type": "link", "children": [{"text": "configured in the admin dashboard"}], "linkType": "custom"}, {"text": "."}]}]	681afd25763e6d41b42832f1	CTA
4	5	version.layout	4	\N	[{"type": "h4", "children": [{"text": "Shop now"}]}, {"children": [{"text": "This is a custom layout building block "}, {"url": "/admin", "type": "link", "children": [{"text": "configured in the admin dashboard"}], "linkType": "custom"}, {"text": "."}]}]	681afd25763e6d41b42832f1	CTA
4	6	version.layout	5	\N	[{"type": "h4", "children": [{"text": "Shop now"}]}, {"children": [{"text": "This is a custom layout building block "}, {"url": "/admin", "type": "link", "children": [{"text": "configured in the admin dashboard"}], "linkType": "custom"}, {"text": "."}]}]	681afd25763e6d41b42832f1	CTA
4	7	version.layout	6	\N	[{"type": "h4", "children": [{"text": "Shop now"}]}, {"children": [{"text": "This is a custom layout building block "}, {"url": "/admin", "type": "link", "children": [{"text": "configured in the admin dashboard"}], "linkType": "custom"}, {"text": "."}]}]	681afd25763e6d41b42832f1	CTA
4	8	version.layout	7	\N	[{"type": "h4", "children": [{"text": "Shop now"}]}, {"children": [{"text": "This is a custom layout building block "}, {"url": "/admin", "type": "link", "children": [{"text": "configured in the admin dashboard"}], "linkType": "custom"}, {"text": "."}]}]	681afd25763e6d41b42832f1	CTA
4	9	version.layout	8	\N	[{"type": "h4", "children": [{"text": "Shop now"}]}, {"children": [{"text": "This is a custom layout building block "}, {"url": "/admin", "type": "link", "children": [{"text": "configured in the admin dashboard"}], "linkType": "custom"}, {"text": "."}]}]	681afd25763e6d41b42832f1	CTA
4	10	version.layout	9	\N	[{"type": "h4", "children": [{"text": "Shop now"}]}, {"children": [{"text": "This is a custom layout building block "}, {"url": "/admin", "type": "link", "children": [{"text": "configured in the admin dashboard"}], "linkType": "custom"}, {"text": "."}]}]	681afd25763e6d41b42832f1	CTA
4	11	version.layout	10	\N	[{"type": "h4", "children": [{"text": "Shop now"}]}, {"children": [{"text": "This is a custom layout building block "}, {"url": "/admin", "type": "link", "children": [{"text": "configured in the admin dashboard"}], "linkType": "custom"}, {"text": "."}]}]	681afd25763e6d41b42832f1	CTA
4	12	version.layout	11	\N	[{"type": "h4", "children": [{"text": "Shop now"}]}, {"children": [{"text": "This is a custom layout building block "}, {"url": "/admin", "type": "link", "children": [{"text": "configured in the admin dashboard"}], "linkType": "custom"}, {"text": "."}]}]	681afd25763e6d41b42832f1	CTA
\.
COPY public._pages_v_blocks_cta_links (_order, _parent_id, id, link_type, link_new_tab, link_url, link_label, link_appearance, _uuid) FROM stdin;
1	1	1	reference	\N		Shop now	primary	681afd25763e6d41b42832fe
1	2	2	reference	\N		Continue shopping	primary	681afd31763e6d41b4283302
1	3	3	reference	\N		Shop now	primary	681afd25763e6d41b42832fe
1	4	4	reference	\N		Shop now	primary	681afd25763e6d41b42832fe
1	5	5	reference	\N		Shop now	primary	681afd25763e6d41b42832fe
1	6	6	reference	\N		Shop now	primary	681afd25763e6d41b42832fe
1	7	7	reference	\N		Shop now	primary	681afd25763e6d41b42832fe
1	8	8	reference	\N		Shop now	primary	681afd25763e6d41b42832fe
1	9	9	reference	\N		Shop now	primary	681afd25763e6d41b42832fe
1	10	10	reference	\N		Shop now	primary	681afd25763e6d41b42832fe
1	11	11	reference	\N		Shop now	primary	681afd25763e6d41b42832fe
\.
COPY public._pages_v_blocks_media_block (_order, _parent_id, _path, id, invert_background, "position", _uuid, block_name) FROM stdin;
2	2	version.layout	1	\N	default	681afd25763e6d41b42832ef	Media Block
2	4	version.layout	2	\N	default	681afd25763e6d41b42832ef	Media Block
2	5	version.layout	3	\N	default	681afd25763e6d41b42832ef	Media Block
2	6	version.layout	4	\N	default	681afd25763e6d41b42832ef	Media Block
2	7	version.layout	5	\N	default	681afd25763e6d41b42832ef	Media Block
2	8	version.layout	6	\N	default	681afd25763e6d41b42832ef	Media Block
2	9	version.layout	7	\N	default	681afd25763e6d41b42832ef	Media Block
2	10	version.layout	8	\N	default	681afd25763e6d41b42832ef	Media Block
2	11	version.layout	9	\N	default	681afd25763e6d41b42832ef	Media Block
2	12	version.layout	10	\N	default	681afd25763e6d41b42832ef	Media Block
\.
COPY public._pages_v_rels (id, "order", parent_id, path, pages_id, media_id, categories_id, products_id) FROM stdin;
1	\N	1	parent	1	\N	\N	\N
2	\N	2	parent	2	\N	\N	\N
3	\N	2	version.hero.links.0.link.reference	1	\N	\N	\N
4	\N	2	version.hero.media	\N	1	\N	\N
5	\N	2	version.layout.1.media	\N	2	\N	\N
6	\N	2	version.layout.3.links.0.link.reference	1	\N	\N	\N
7	\N	2	version.meta.image	\N	1	\N	\N
8	\N	3	parent	3	\N	\N	\N
9	\N	3	version.layout.1.links.0.link.reference	1	\N	\N	\N
10	\N	4	parent	2	\N	\N	\N
11	\N	4	version.hero.links.0.link.reference	1	\N	\N	\N
12	\N	4	version.hero.media	\N	1	\N	\N
13	\N	4	version.layout.1.media	\N	2	\N	\N
14	\N	4	version.layout.3.links.0.link.reference	1	\N	\N	\N
15	\N	4	version.meta.image	\N	1	\N	\N
16	\N	5	parent	2	\N	\N	\N
17	\N	5	version.hero.links.0.link.reference	1	\N	\N	\N
18	\N	5	version.hero.media	\N	8	\N	\N
19	\N	5	version.layout.1.media	\N	2	\N	\N
20	\N	5	version.layout.3.links.0.link.reference	1	\N	\N	\N
21	\N	5	version.meta.image	\N	1	\N	\N
22	\N	6	parent	2	\N	\N	\N
23	\N	6	version.hero.links.0.link.reference	1	\N	\N	\N
24	\N	6	version.hero.media	\N	8	\N	\N
25	\N	6	version.layout.1.media	\N	2	\N	\N
26	\N	6	version.layout.3.links.0.link.reference	1	\N	\N	\N
27	\N	7	parent	2	\N	\N	\N
28	\N	7	version.hero.links.0.link.reference	1	\N	\N	\N
29	\N	7	version.hero.media	\N	9	\N	\N
30	\N	7	version.layout.1.media	\N	2	\N	\N
31	\N	7	version.layout.3.links.0.link.reference	1	\N	\N	\N
32	\N	8	parent	2	\N	\N	\N
33	\N	8	version.hero.links.0.link.reference	1	\N	\N	\N
34	\N	8	version.hero.media	\N	10	\N	\N
35	\N	8	version.layout.1.media	\N	2	\N	\N
36	\N	8	version.layout.3.links.0.link.reference	1	\N	\N	\N
37	\N	9	parent	2	\N	\N	\N
38	\N	9	version.hero.links.0.link.reference	1	\N	\N	\N
39	\N	9	version.hero.media	\N	10	\N	\N
40	\N	9	version.layout.1.media	\N	2	\N	\N
41	\N	9	version.layout.3.links.0.link.reference	1	\N	\N	\N
42	\N	10	parent	2	\N	\N	\N
43	\N	10	version.hero.links.0.link.reference	1	\N	\N	\N
44	\N	10	version.hero.media	\N	10	\N	\N
45	\N	10	version.layout.1.media	\N	2	\N	\N
46	\N	10	version.layout.3.links.0.link.reference	1	\N	\N	\N
47	\N	11	parent	2	\N	\N	\N
48	\N	11	version.hero.links.0.link.reference	1	\N	\N	\N
49	\N	11	version.hero.media	\N	11	\N	\N
50	\N	11	version.layout.1.media	\N	2	\N	\N
51	\N	11	version.layout.3.links.0.link.reference	1	\N	\N	\N
52	\N	12	parent	2	\N	\N	\N
53	\N	12	version.hero.links.0.link.reference	1	\N	\N	\N
54	\N	12	version.hero.media	\N	13	\N	\N
55	\N	12	version.layout.1.media	\N	2	\N	\N
56	\N	12	version.layout.3.links.0.link.reference	1	\N	\N	\N
57	\N	13	parent	1	\N	\N	\N
58	\N	14	parent	1	\N	\N	\N
59	\N	15	parent	1	\N	\N	\N
60	\N	16	parent	1	\N	\N	\N
\.
COPY public._pages_v_version_hero_links (_order, _parent_id, id, link_type, link_new_tab, link_url, link_label, link_appearance, _uuid) FROM stdin;
1	2	1	reference	\N		Shop now	primary	681afd25763e6d41b42832f2
2	2	2	custom	t	https://github.com/payloadcms/payload/tree/main/templates/ecommerce	View on GitHub	secondary	681afd25763e6d41b42832f3
1	4	3	reference	\N		Shop now	primary	681afd25763e6d41b42832f2
2	4	4	custom	t	https://github.com/payloadcms/payload/tree/main/templates/ecommerce	View on GitHub	secondary	681afd25763e6d41b42832f3
1	5	5	reference	\N		Shop now	primary	681afd25763e6d41b42832f2
1	6	6	reference	\N		Shop now	primary	681afd25763e6d41b42832f2
1	7	7	reference	\N		Shop now	primary	681afd25763e6d41b42832f2
1	8	8	reference	\N		Shop now	primary	681afd25763e6d41b42832f2
1	9	9	reference	\N		Shop now	primary	681afd25763e6d41b42832f2
1	10	10	reference	\N		Shop now	primary	681afd25763e6d41b42832f2
1	11	11	reference	\N		Shop now	primary	681afd25763e6d41b42832f2
1	12	12	reference	\N		Shop now	primary	681afd25763e6d41b42832f2
\.
COPY public._products_v (id, version_title, version_published_on, version_stripe_product_i_d, version_price_j_s_o_n, version_enable_paywall, version_slug, version_skip_sync, version_meta_title, version_meta_description, version_updated_at, version_created_at, version__status, created_at, updated_at, latest) FROM stdin;
8	Custom Canvas Art | Kikky Art Studio- HxH Gon and Kilua	2025-05-08 13:35:36.155+00	\N	\N	\N	kikky-art-studio--hxh-gon-and-kilua	f	Custom Canvas Art | Kikky Art Studio- HxH Gon and Kilua	Stunning hand-painted canvas artwork featuring Gon Freecss and Killua Zoldyck from Hunter x Hunter. 	2025-05-08 13:35:37.108+00	2025-05-08 13:35:37.052+00	published	2025-05-08 13:35:37.052+00	2025-05-08 13:35:37.052+00	t
9	Transforming Scars Into Stunning Tattoo Art	2025-05-08 12:42:13.416+00	\N	\N	\N	transforming-scars-into-stunning-tattoo-art	f	Transforming Scars Into Stunning Tattoo Art-Kikky art	This expertly crafted cover-up tattoo seamlessly blends a detailed compass rose and a roman numeral timepiece to transform and conceal scars .	2025-05-08 13:36:09.889+00	2025-05-08 12:42:14.275+00	published	2025-05-08 13:36:07.962+00	2025-05-08 13:36:07.962+00	t
7	Transforming Scars Into Stunning Tattoo Art	2025-05-08 12:42:13.416+00	\N	\N	\N	transforming-scars-into-stunning-tattoo-art	f	Transforming Scars Into Stunning Tattoo Art-Kikky art	This expertly crafted cover-up tattoo seamlessly blends a detailed compass rose and a roman numeral timepiece to transform and conceal scars .	2025-05-08 12:42:14.459+00	2025-05-08 12:42:14.275+00	published	2025-05-08 12:42:14.275+00	2025-05-08 12:42:14.275+00	f
10	Urban Street Art Mural – Vibrant Cityscape on Container Wall	2025-05-08 13:41:29.185+00	\N	\N	\N	urban-street-art-mural--vibrant-cityscape-on-container-wall	f	Urban Street Art Mural – Vibrant Cityscape on Container Wall	Experience the essence of city nightlife through this captivating urban street art mural featuring a cityscape with glowing lights and  skyscrapers.	2025-05-08 13:41:30.119+00	2025-05-08 13:41:30.095+00	published	2025-05-08 13:41:30.095+00	2025-05-08 13:41:30.095+00	t
11	Neon Glow Portrait  – Afrocentric Expressionism on Canvas	2025-05-08 13:45:29.495+00	\N	\N	\N	neon-glow-portrait---afrocentric-expressionism-on-canvas	f	Neon Glow Portrait  – Afrocentric Expressionism on Canvas	Illuminate your space with this powerful Afrocentric portrait, painted in a unique blend of neon hues and expressive brushwork.	2025-05-08 13:45:30.839+00	2025-05-08 13:45:30.41+00	published	2025-05-08 13:45:30.41+00	2025-05-08 13:45:30.41+00	t
14	Batman Forearm Tattoo – Dark Knight Black Ink Design	2025-05-08 13:48:27.657+00	\N	\N	\N	batman-forearm-tattoo--dark-knight-black-ink-design	f	Batman Forearm Tattoo – Dark Knight Black Ink Design	Featuring detailed linework and bold shading, this black ink design brings the iconic Dark Knight to life with a fierce and artistic edge	2025-05-08 14:23:18.757+00	2025-05-08 13:48:28.57+00	published	2025-05-08 14:23:16.312+00	2025-05-08 14:23:16.312+00	t
12	Batman Forearm Tattoo – Dark Knight Black Ink Design	2025-05-08 13:48:27.657+00	\N	\N	\N	batman-forearm-tattoo--dark-knight-black-ink-design	f	Batman Forearm Tattoo – Dark Knight Black Ink Design	Featuring detailed linework and bold shading, this black ink design brings the iconic Dark Knight to life with a fierce and artistic edge	2025-05-08 13:48:28.616+00	2025-05-08 13:48:28.57+00	published	2025-05-08 13:48:28.57+00	2025-05-08 13:48:28.57+00	f
13	Batman Forearm Tattoo – Dark Knight Black Ink Design	2025-05-08 13:48:27.657+00	\N	\N	\N	batman-forearm-tattoo--dark-knight-black-ink-design	f	Batman Forearm Tattoo – Dark Knight Black Ink Design	Featuring detailed linework and bold shading, this black ink design brings the iconic Dark Knight to life with a fierce and artistic edge	2025-05-08 13:50:11.195+00	2025-05-08 13:48:28.57+00	published	2025-05-08 13:50:08.267+00	2025-05-08 13:50:08.267+00	f
\.
COPY public._products_v_blocks_archive (_order, _parent_id, _path, id, intro_content, "populateBy", "relationTo", "limit", populated_docs_total, _uuid, block_name) FROM stdin;
\.
COPY public._products_v_blocks_content (_order, _parent_id, _path, id, invert_background, _uuid, block_name) FROM stdin;
1	7	version.layout	11	\N	681ca6a5aa58c90e08bcfdc9	\N
1	8	version.layout	12	\N	681cb328aa58c90e08bcfdca	\N
1	9	version.layout	13	\N	681ca6a5aa58c90e08bcfdc9	\N
1	10	version.layout	14	\N	681cb489aa58c90e08bcfdcc	\N
1	11	version.layout	15	\N	681cb579aa58c90e08bcfdcd	\N
1	12	version.layout	16	\N	681cb62baa58c90e08bcfdce	\N
1	13	version.layout	17	\N	681cb62baa58c90e08bcfdce	\N
\.
COPY public._products_v_blocks_content_columns (_order, _parent_id, id, size, rich_text, enable_link, link_type, link_new_tab, link_url, link_label, link_appearance, _uuid) FROM stdin;
\.
COPY public._products_v_blocks_cta (_order, _parent_id, _path, id, invert_background, rich_text, _uuid, block_name) FROM stdin;
\.
COPY public._products_v_blocks_cta_links (_order, _parent_id, id, link_type, link_new_tab, link_url, link_label, link_appearance, _uuid) FROM stdin;
\.
COPY public._products_v_blocks_media_block (_order, _parent_id, _path, id, invert_background, "position", _uuid, block_name) FROM stdin;
\.
COPY public._products_v_rels (id, "order", parent_id, path, products_id, pages_id, media_id, categories_id) FROM stdin;
25	\N	7	parent	4	\N	\N	\N
26	\N	7	version.meta.image	\N	\N	31	\N
27	\N	8	parent	5	\N	\N	\N
28	1	8	version.categories	\N	\N	\N	4
29	\N	8	version.meta.image	\N	\N	32	\N
30	\N	9	parent	4	\N	\N	\N
31	1	9	version.categories	\N	\N	\N	5
32	\N	9	version.meta.image	\N	\N	31	\N
33	\N	10	parent	6	\N	\N	\N
34	1	10	version.categories	\N	\N	\N	4
35	\N	10	version.meta.image	\N	\N	33	\N
36	\N	11	parent	7	\N	\N	\N
37	1	11	version.categories	\N	\N	\N	4
38	\N	11	version.meta.image	\N	\N	34	\N
39	\N	12	parent	8	\N	\N	\N
40	1	12	version.categories	\N	\N	\N	5
41	\N	12	version.meta.image	\N	\N	35	\N
42	\N	13	parent	8	\N	\N	\N
43	1	13	version.categories	\N	\N	\N	5
44	1	13	version.relatedProducts	4	\N	\N	\N
45	\N	13	version.meta.image	\N	\N	35	\N
46	\N	14	parent	8	\N	\N	\N
47	1	14	version.categories	\N	\N	\N	5
48	1	14	version.relatedProducts	4	\N	\N	\N
49	\N	14	version.meta.image	\N	\N	35	\N
\.
COPY public.categories (id, title, updated_at, created_at) FROM stdin;
5	Tattoo collections	2025-05-08 01:14:42.152+00	2025-05-08 01:14:42.194+00
4	Canvas Art Collections	2025-05-08 07:25:59.527+00	2025-05-08 01:08:45.111+00
6	Tattoo Supplies & Tools	2025-05-08 14:05:35.486+00	2025-05-08 01:15:56.678+00
7	Client Services	2025-05-08 14:06:21.27+00	2025-05-08 07:09:56.56+00
\.
COPY public.categories_breadcrumbs (_order, _parent_id, id, url, label) FROM stdin;
1	5	681c05821cf96e2dec30d50b	\N	Tattoo collections
1	4	681c5c876f745c142845619f	\N	Canvas Art Collections
1	6	681cba2faa58c90e08bcfdd2	\N	Tattoo Supplies & Tools
1	7	681cba5daa58c90e08bcfdd3	\N	Client Services
\.
COPY public.categories_rels (id, "order", parent_id, path, media_id, categories_id) FROM stdin;
8	\N	5	media	15	\N
9	\N	5	breadcrumbs.0.doc	\N	5
46	\N	4	media	28	\N
47	\N	4	breadcrumbs.0.doc	\N	4
58	\N	6	media	38	\N
59	\N	6	breadcrumbs.0.doc	\N	6
60	\N	7	media	39	\N
61	\N	7	breadcrumbs.0.doc	\N	7
\.
COPY public.footer (id, copyright, updated_at, created_at) FROM stdin;
1	'© 2025 Kikky. All rights reserved.	2025-05-07 12:20:22.207+00	\N
\.
COPY public.footer_nav_items (_order, _parent_id, id, link_type, link_new_tab, link_url, link_label) FROM stdin;
1	1	681b4d4b26de9721ff73411b	custom	\N	https://www.instagram.com/kikky_tattoos?igsh=MWJ0Y21yZHZyczBydQ==	instagram
2	1	681b4de826de9721ff73411c	custom	\N	https://wa.link/n4bymb	WhatsApp link
\.
COPY public.footer_rels (id, "order", parent_id, path, pages_id, media_id) FROM stdin;
4	\N	1	navItems.0.link.icon	\N	6
5	\N	1	navItems.1.link.icon	\N	7
\.
COPY public.header (id, updated_at, created_at) FROM stdin;
1	2025-05-07 11:17:52.484+00	\N
\.
COPY public.header_nav_items (_order, _parent_id, id, link_type, link_new_tab, link_url, link_label) FROM stdin;
1	1	681b40f28ddda214d0fb664b	reference	\N	\N	Home
2	1	681afd3c763e6d41b4283303	reference	\N	\N	Shop
\.
COPY public.header_rels (id, "order", parent_id, path, pages_id, media_id) FROM stdin;
2	\N	1	navItems.0.link.reference	2	\N
3	\N	1	navItems.1.link.reference	1	\N
\.
COPY public.media (id, alt, caption, updated_at, created_at, url, filename, mime_type, filesize, width, height, focal_x, focal_y) FROM stdin;
1	Shirts	[{"children": [{"text": "Photo by "}, {"url": "https://unsplash.com/@henmankk?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText", "type": "link", "newTab": true, "children": [{"text": "Keagan Henman"}], "linkType": "custom"}, {"text": " on "}, {"url": "https://unsplash.com/photos/Won79_9oUEk?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText", "type": "link", "newTab": true, "children": [{"text": "Unsplash"}], "linkType": "custom"}, {"text": "."}]}]	2025-05-07 06:25:22.316+00	2025-05-07 06:25:22.316+00	\N	image-1.jpg	image/jpeg	93586	1920	1281	50	50
2	E-Book	[{"children": [{"text": "Photo by "}, {"url": "https://unsplash.com/@jamestarbotton?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText", "type": "link", "newTab": true, "children": [{"text": "James Tarbotton"}], "linkType": "custom"}, {"text": " on "}, {"url": "https://unsplash.com/photos/PkyL3p9Kx8c?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText", "type": "link", "newTab": true, "children": [{"text": "Unsplash"}], "linkType": "custom"}, {"text": "."}]}]	2025-05-07 06:25:23.485+00	2025-05-07 06:25:23.485+00	\N	image-2.jpg	image/jpeg	349328	1920	1272	50	50
3	Online Course	[{"children": [{"text": "Photo by "}, {"url": "https://unsplash.com/@christinhumephoto?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText", "type": "link", "newTab": true, "children": [{"text": "Christin Hume"}], "linkType": "custom"}, {"text": " on "}, {"url": "https://unsplash.com/photos/Hcfwew744z4?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText", "type": "link", "newTab": true, "children": [{"text": "Unsplash"}], "linkType": "custom"}, {"text": "."}]}]	2025-05-07 06:25:24.592+00	2025-05-07 06:25:24.592+00	\N	image-3.jpg	image/jpeg	248185	1920	1280	50	50
4	Instagram	\N	2025-05-07 12:09:32.891+00	2025-05-07 12:09:32.891+00	\N	instagram.jpg	image/jpeg	81410	626	626	50	50
5	whats app	\N	2025-05-07 12:15:35.409+00	2025-05-07 12:15:35.409+00	\N	whatsapp.jpg	image/jpeg	22823	736	736	50	50
6	Instagram	\N	2025-05-07 12:20:01.164+00	2025-05-07 12:20:01.164+00	\N	instagram-removebg.png	image/png	154059	499	499	50	50
7	whats app	\N	2025-05-07 12:20:15.044+00	2025-05-07 12:20:15.044+00	\N	whatsapp-removebg.png	image/png	98633	500	500	50	50
8	kikky art	\N	2025-05-08 00:06:42.252+00	2025-05-08 00:06:42.252+00	\N	hero2.png	image/png	349753	831	587	50	50
9	kikky art	\N	2025-05-08 00:27:36.974+00	2025-05-08 00:27:36.974+00	\N	hero.jpg	image/jpeg	89887	736	904	50	50
10	kikky art	\N	2025-05-08 00:31:10.013+00	2025-05-08 00:31:10.013+00	\N	hero3.jpg	image/jpeg	66065	736	1050	50	50
11	kikky art	\N	2025-05-08 00:33:44.202+00	2025-05-08 00:33:44.202+00	\N	hero2.jpg	image/jpeg	125941	736	1104	50	50
12	kikky art	\N	2025-05-08 00:34:56.434+00	2025-05-08 00:34:56.434+00	\N	hero4.jpg	image/jpeg	45129	454	626	50	50
13	kikky art	\N	2025-05-08 00:35:56.113+00	2025-05-08 00:35:56.113+00	\N	hero5.jpg	image/jpeg	27326	400	640	50	50
14	Graffiti & Street-Inspired Canvases	\N	2025-05-08 01:08:31.959+00	2025-05-08 01:08:31.959+00	\N	camvas street style.png	image/png	418693	588	518	50	50
15	tattoo sessions	\N	2025-05-08 01:14:33.917+00	2025-05-08 01:14:33.917+00	\N	tattoo.png	image/png	225151	308	409	50	50
16	Tattoo Supplies & Tools	\N	2025-05-08 01:15:49.988+00	2025-05-08 01:15:49.988+00	\N	â¢ Wireless Tattoo Pen Cartridge _The kit includesâ¦.jpg	image/jpeg	79537	736	736	50	50
17	Tattoo Supplies & Tools	\N	2025-05-08 01:20:07.797+00	2025-05-08 01:20:07.797+00	\N	â¢ Wireless Tattoo Pen Cartridge _The kit includesâ¦-1.jpg	image/jpeg	79537	736	736	50	50
18	Tattoo Supplies & Tools	\N	2025-05-08 01:21:05.377+00	2025-05-08 01:21:05.377+00	\N	tattoo-1.png	image/png	225151	308	409	50	50
19	Tattoo Supplies & Tools	\N	2025-05-08 01:24:23.558+00	2025-05-08 01:23:19.599+00	http://localhost:3000/media/â¢ Wireless Tattoo Pen Cartridge _The kit includesâ¦-2.jpg	â¢ Wireless Tattoo Pen Cartridge _The kit includesâ¦-2.jpg	image/jpeg	31064	308	409	50	50
35	batman	\N	2025-05-08 13:46:41.84+00	2025-05-08 13:46:41.84+00	\N	half-sleeve.png	image/png	380418	470	589	50	50
20	Tattoo Supplies & Tools	\N	2025-05-08 01:27:35.859+00	2025-05-08 01:26:10.967+00	http://localhost:3000/media/New Cartridges Rotary Pen Tattoo Machine Powerâ¦.jpg	New Cartridges Rotary Pen Tattoo Machine Powerâ¦.jpg	image/jpeg	35498	308	409	50	50
21	Tattoo Supplies & Tools	\N	2025-05-08 01:28:38.469+00	2025-05-08 01:28:38.469+00	\N	New Cartridges Rotary Pen Tattoo Machine Powerâ¦-1.jpg	image/jpeg	34259	308	409	50	50
22	Graffiti & Street-Inspired Canvases	\N	2025-05-08 01:30:03.233+00	2025-05-08 01:30:03.233+00	\N	camvas street style-1.png	image/png	247445	308	409	50	50
23	Graffiti & Street-Inspired Canvases	\N	2025-05-08 01:37:47.7+00	2025-05-08 01:37:47.7+00	\N	street art.png	image/png	323756	588	587	50	50
24	Tattoo Supplies & Tools	\N	2025-05-08 01:43:37.457+00	2025-05-08 01:43:37.457+00	\N	New Cartridges Rotary Pen Tattoo Machine Powerâ¦-2.jpg	image/jpeg	49516	500	500	50	50
25	Client Services	\N	2025-05-08 07:09:47.111+00	2025-05-08 07:09:47.111+00	\N	New Cartridges Rotary Pen Tattoo Machine Powerâ¦-3.jpg	image/jpeg	49516	500	500	50	50
26	kikky art	\N	2025-05-08 07:11:32.04+00	2025-05-08 07:11:32.04+00	\N	New Cartridges Rotary Pen Tattoo Machine Powerâ¦-4.jpg	image/jpeg	34259	308	409	50	50
27	Graffiti & Street-Inspired Canvases	\N	2025-05-08 07:24:27.249+00	2025-05-08 07:24:27.249+00	\N	street-art.png	image/png	323756	588	587	50	50
28	Graffiti & Street-Inspired Canvases	\N	2025-05-08 07:25:55.658+00	2025-05-08 07:25:55.658+00	\N	street-art-1.png	image/png	323756	588	587	50	50
29	Tattoo Supplies & Tools	\N	2025-05-08 07:26:57.326+00	2025-05-08 07:26:57.326+00	\N	supplies.jpg	image/jpeg	49516	500	500	50	50
30	customer services	\N	2025-05-08 07:28:47.043+00	2025-05-08 07:28:47.043+00	\N	custom-services.jpg	image/jpeg	193616	736	1323	50	50
31	kikky art	\N	2025-05-08 12:41:54.105+00	2025-05-08 12:41:54.105+00	\N	cover-up.png	image/png	452613	472	591	50	50
32	HxH	\N	2025-05-08 13:21:51.22+00	2025-05-08 13:21:51.22+00	\N	canvas-hxh.png	image/png	394625	471	591	50	50
33	Graffiti & Street- Canvases	\N	2025-05-08 13:37:01.295+00	2025-05-08 13:37:01.295+00	\N	camvas street style-2.png	image/png	418693	588	518	50	50
34	kikky art	\N	2025-05-08 13:42:56.268+00	2025-05-08 13:42:56.268+00	\N	hero1.png	image/png	422883	587	585	50	50
36	tattoo sessions	\N	2025-05-08 13:58:42.012+00	2025-05-08 13:58:42.012+00	\N	Iâm ready to take on a few more projects!.jpg	image/jpeg	113943	736	1308	50	50
37	Tattoo Supplies & Tools	\N	2025-05-08 14:02:35.69+00	2025-05-08 14:02:35.69+00	\N	Tattoo Shops Near Me_ A Guide for Tattoo Enthusiasts & First-Time Seekers.jpg	image/jpeg	84190	736	981	50	50
38	Tattoo Supplies & Tools	\N	2025-05-08 14:05:21.381+00	2025-05-08 14:05:21.381+00	\N	supplie-tat.jpg	image/jpeg	84190	736	981	50	50
39	kikky art	\N	2025-05-08 14:06:17.997+00	2025-05-08 14:06:17.997+00	\N	client.jpg	image/jpeg	54846	736	689	50	50
\.
COPY public.orders (id, stripe_payment_intent_i_d, total, updated_at, created_at) FROM stdin;
\.
COPY public.orders_items (_order, _parent_id, id, price, quantity) FROM stdin;
\.
COPY public.orders_rels (id, "order", parent_id, path, users_id, products_id) FROM stdin;
\.
COPY public.pages (id, title, published_on, hero_type, hero_rich_text, slug, meta_title, meta_description, updated_at, created_at, _status) FROM stdin;
3	Cart	2025-05-07 06:26:57.711+00	lowImpact	[{"type": "h1", "children": [{"text": "Cart"}]}, {"type": "p", "children": [{"text": "This cart saves to local storage so you can continue shopping later. Once you authenticate with Payload, your cart will sync to your user profile so you can continue shopping from any device. This hero and the content below the cart are completely dynamic and "}, {"url": "/admin", "type": "link", "children": [{"text": "configured in the admin dashboard"}], "linkType": "custom"}]}]	cart	Cart	Your cart will sync to your user profile so you can continue shopping from any device.	2025-05-07 06:26:57.078+00	2025-05-07 06:26:57.078+00	published
1	Products	2025-05-07 06:26:39.214+00	lowImpact	[{"type": "p", "children": [{"text": "From premium tattoo supplies to custom canvas paintings, Kikky Art Studio brings you quality tools and creative pieces designed to inspire every artist and collector.\\n\\n"}]}]	products	Kikky art studio - Explore Our Art & Tattoo Essentials	From premium tattoo supplies to custom canvas paintings, Kikky Art Studio brings you quality tools and creative pieces .	2025-05-08 13:17:55.51+00	2025-05-08 13:16:55.957+00	published
2	Home	2025-05-07 06:26:45.944+00	customHero	[{"type": "h3", "children": [{"bold": true, "text": "Welcome to "}]}, {"type": "large-body", "children": [{"bold": true, "text": "Kikky Art Studio"}]}, {"type": "large-body", "children": [{"text": "Your creative partner in "}]}, {"type": "large-body", "children": [{"text": "transforming spaces and expressions. \\n\\n"}]}]	home	My Store	An open-source e-commerce store built with Payload and Next.js.	2025-05-08 00:35:59.524+00	2025-05-08 00:33:47.873+00	published
\.
COPY public.pages_blocks_archive (_order, _parent_id, _path, id, intro_content, "populateBy", "relationTo", "limit", populated_docs_total, block_name) FROM stdin;
3	2	layout	681afd25763e6d41b42832f0	[{"type": "h4", "children": [{"text": "Recent Products"}]}, {"type": "p", "children": [{"text": "The products below are displayed in an \\"Archive\\" layout building block which is an extremely powerful way to display documents on a page. It can be auto-populated by collection or by category, or products can be individually selected. Pagination controls will automatically appear if the number of results exceeds the number of items per page."}]}]	collection	products	10	\N	Archive Block
1	1	layout	681afd1f763e6d41b42832ed	[{"type": "p", "children": [{"text": "From premium tattoo supplies to custom canvas paintings, Kikky Art Studio brings you quality tools and creative pieces designed to inspire every artist and collector."}]}]	collection	products	10	\N	Archive Block
\.
COPY public.pages_blocks_content (_order, _parent_id, _path, id, invert_background, block_name) FROM stdin;
1	3	layout	681afd31763e6d41b42832ff	\N	\N
1	2	layout	681afd25763e6d41b42832ee	\N	Content Block
\.
COPY public.pages_blocks_content_columns (_order, _parent_id, id, size, rich_text, enable_link, link_type, link_new_tab, link_url, link_label, link_appearance) FROM stdin;
1	681afd31763e6d41b42832ff	681afd31763e6d41b4283301	twoThirds	[{"children": [{"text": "This is a custom layout building block configurable in the CMS—this can be anything you want. Related or suggested products, a blog post, video, etc."}]}]	\N	reference	\N			default
1	681afd25763e6d41b42832ee	681afd25763e6d41b42832f4	full	[{"type": "h2", "children": [{"text": "Core Features"}]}, {"children": [{"text": ""}]}]	\N	reference	\N	\N	\N	default
2	681afd25763e6d41b42832ee	681afd25763e6d41b42832f5	oneThird	[{"type": "h3", "children": [{"text": "Admin Dashboard"}]}, {"children": [{"text": "Manage this site's users, pages, products, and more from the "}, {"url": "/admin", "type": "link", "children": [{"text": "admin dashboard"}], "linkType": "custom"}, {"text": "."}]}]	f	reference	\N			default
3	681afd25763e6d41b42832ee	681afd25763e6d41b42832f6	oneThird	[{"type": "h3", "children": [{"text": "Authentication"}]}, {"children": [{"text": "User "}, {"url": "/login", "type": "link", "children": [{"text": "login"}], "linkType": "custom"}, {"text": " and "}, {"url": "/create-account", "type": "link", "children": [{"text": "create account"}], "linkType": "custom"}, {"text": " flows are complete with email verification and password reset."}]}]	f	reference	\N			default
4	681afd25763e6d41b42832ee	681afd25763e6d41b42832f7	oneThird	[{"type": "h3", "children": [{"text": "Customer Accounts"}]}, {"children": [{"text": "Customers can "}, {"url": "/account", "type": "link", "children": [{"text": "manage their account"}], "linkType": "custom"}, {"text": ", "}, {"url": "/orders", "type": "link", "children": [{"text": "view their order history"}], "linkType": "custom"}, {"text": ", and more without leaving the site."}]}]	f	reference	\N			default
5	681afd25763e6d41b42832ee	681afd25763e6d41b42832f8	oneThird	[{"type": "h3", "children": [{"text": "Paywall"}]}, {"children": [{"text": "Easily gate digital content behind a paywall or require users to be logged in to access it."}]}]	f	reference	\N			default
6	681afd25763e6d41b42832ee	681afd25763e6d41b42832f9	oneThird	[{"type": "h3", "children": [{"text": "Shopping Cart"}]}, {"children": [{"text": "Shopping carts persist between sessions, can be saved for later, and are accessible from any device."}]}]	f	reference	\N			default
7	681afd25763e6d41b42832ee	681afd25763e6d41b42832fa	oneThird	[{"type": "h3", "children": [{"text": "Checkout"}]}, {"children": [{"text": "Secure in-app checkout powered by Stripe means your customers never have to leave your site."}]}]	f	reference	\N			default
8	681afd25763e6d41b42832ee	681afd25763e6d41b42832fb	oneThird	[{"type": "h3", "children": [{"text": "Page Builder"}]}, {"children": [{"text": "Custom page builder allows you to create unique page and product layouts for any type of content."}]}]	f	reference	\N			default
9	681afd25763e6d41b42832ee	681afd25763e6d41b42832fc	oneThird	[{"type": "h3", "children": [{"text": "SEO"}]}, {"children": [{"text": "Editors have complete control over SEO data and site content directly from the "}, {"url": "/admin", "type": "link", "children": [{"text": "admin dashboard"}], "linkType": "custom"}, {"text": "."}]}]	f	reference	\N			default
10	681afd25763e6d41b42832ee	681afd25763e6d41b42832fd	oneThird	[{"type": "h3", "children": [{"text": "Dark Mode"}]}, {"children": [{"text": "Users will experience this site in their preferred color scheme, and each block can be inverted."}]}]	f	reference	\N			default
\.
COPY public.pages_blocks_cta (_order, _parent_id, _path, id, invert_background, rich_text, block_name) FROM stdin;
2	3	layout	681afd31763e6d41b4283300	\N	[{"type": "h4", "children": [{"text": "Continue shopping"}]}, {"children": [{"text": "This is a custom layout building block "}, {"url": "/admin", "type": "link", "children": [{"text": "configured in the admin dashboard"}], "linkType": "custom"}, {"text": "."}]}]	CTA
4	2	layout	681afd25763e6d41b42832f1	\N	[{"type": "h4", "children": [{"text": "Shop now"}]}, {"children": [{"text": "This is a custom layout building block "}, {"url": "/admin", "type": "link", "children": [{"text": "configured in the admin dashboard"}], "linkType": "custom"}, {"text": "."}]}]	CTA
\.
COPY public.pages_blocks_cta_links (_order, _parent_id, id, link_type, link_new_tab, link_url, link_label, link_appearance) FROM stdin;
1	681afd31763e6d41b4283300	681afd31763e6d41b4283302	reference	\N		Continue shopping	primary
1	681afd25763e6d41b42832f1	681afd25763e6d41b42832fe	reference	\N		Shop now	primary
\.
COPY public.pages_blocks_media_block (_order, _parent_id, _path, id, invert_background, "position", block_name) FROM stdin;
2	2	layout	681afd25763e6d41b42832ef	\N	default	Media Block
\.
COPY public.pages_hero_links (_order, _parent_id, id, link_type, link_new_tab, link_url, link_label, link_appearance) FROM stdin;
1	2	681afd25763e6d41b42832f2	reference	\N		Shop now	primary
\.
COPY public.pages_rels (id, "order", parent_id, path, pages_id, media_id, categories_id, products_id) FROM stdin;
6	\N	3	layout.1.links.0.link.reference	1	\N	\N	\N
37	\N	2	hero.links.0.link.reference	1	\N	\N	\N
38	\N	2	hero.media	\N	13	\N	\N
39	\N	2	layout.1.media	\N	2	\N	\N
40	\N	2	layout.3.links.0.link.reference	1	\N	\N	\N
\.
COPY public.payload_migrations (id, name, batch, updated_at, created_at) FROM stdin;
1	dev	-1	2025-05-08 17:29:45.003+00	2025-05-06 18:22:31.031+00
\.
COPY public.payload_preferences (id, key, value, updated_at, created_at) FROM stdin;
3	collection-pages-2	{"fields": {"tabs-1": {"tabIndex": 0}, "hero.links": {"collapsed": []}}}	2025-05-07 23:49:27.702+00	2025-05-07 23:49:27.702+00
7	collection-pages-1	{"fields": {"tabs-1": {"tabIndex": 1}}}	2025-05-08 13:16:11.949+00	2025-05-08 13:16:11.949+00
5	collection-categories-4	{"fields": {"breadcrumbs": {"collapsed": []}}}	2025-05-08 01:38:09.841+00	2025-05-08 01:38:09.841+00
4	categories-list	{"columns": [{"active": true, "accessor": "_select"}, {"active": true, "accessor": "title"}, {"active": true, "accessor": "id"}, {"active": true, "accessor": "media"}, {"active": true, "accessor": "parent"}, {"active": false, "accessor": "breadcrumbs"}, {"active": false, "accessor": "updatedAt"}, {"active": false, "accessor": "createdAt"}]}	2025-05-08 00:54:13.914+00	2025-05-08 00:54:13.914+00
6	products-list	{"limit": "10", "columns": [{"active": true, "accessor": "_select"}, {"active": true, "accessor": "title"}, {"active": true, "accessor": "stripeProductID"}, {"active": true, "accessor": "_status"}, {"active": false, "accessor": "id"}, {"active": false, "accessor": "publishedOn"}, {"active": false, "accessor": "layout"}, {"active": false, "accessor": "priceJSON"}, {"active": false, "accessor": "enablePaywall"}, {"active": false, "accessor": "paywall"}, {"active": false, "accessor": "categories"}, {"active": false, "accessor": "relatedProducts"}, {"active": false, "accessor": "slug"}, {"active": false, "accessor": "skipSync"}, {"active": false, "accessor": "meta"}, {"active": false, "accessor": "updatedAt"}, {"active": false, "accessor": "createdAt"}]}	2025-05-08 11:59:29.267+00	2025-05-08 11:59:29.267+00
2	media-list	{"sort": null, "columns": [{"active": true, "accessor": "filename"}, {"active": true, "accessor": "id"}, {"active": true, "accessor": "alt"}, {"active": true, "accessor": "caption"}, {"active": false, "accessor": "updatedAt"}, {"active": false, "accessor": "createdAt"}, {"active": false, "accessor": "url"}, {"active": false, "accessor": "mimeType"}, {"active": false, "accessor": "filesize"}, {"active": false, "accessor": "width"}, {"active": false, "accessor": "height"}, {"active": false, "accessor": "focalX"}, {"active": false, "accessor": "focalY"}]}	2025-05-07 12:09:03.762+00	2025-05-07 12:09:03.762+00
1	pages-list	{"columns": [{"active": true, "accessor": "_select"}, {"active": true, "accessor": "title"}, {"active": true, "accessor": "slug"}, {"active": true, "accessor": "updatedAt"}, {"active": false, "accessor": "id"}, {"active": false, "accessor": "publishedOn"}, {"active": false, "accessor": "hero"}, {"active": false, "accessor": "layout"}, {"active": false, "accessor": "meta"}, {"active": false, "accessor": "createdAt"}, {"active": false, "accessor": "_status"}]}	2025-05-07 06:31:22.204+00	2025-05-07 06:31:22.204+00
8	collection-products-8	{"fields": {"layout": {"collapsed": ["681cb62baa58c90e08bcfdce"]}}}	2025-05-08 14:23:12.953+00	2025-05-08 14:23:12.953+00
9	collection-products-8	{"fields": {"layout": {"collapsed": []}}}	2025-05-08 14:23:13.075+00	2025-05-08 14:23:13.075+00
\.
COPY public.payload_preferences_rels (id, "order", parent_id, path, users_id) FROM stdin;
8	\N	3	user	1
23	\N	5	user	1
27	\N	2	user	1
38	\N	1	user	1
41	\N	7	user	1
49	\N	4	user	1
50	\N	6	user	1
51	\N	8	user	1
52	\N	9	user	1
\.
COPY public.products (id, title, published_on, stripe_product_i_d, price_j_s_o_n, enable_paywall, slug, skip_sync, meta_title, meta_description, updated_at, created_at, _status) FROM stdin;
5	Custom Canvas Art | Kikky Art Studio- HxH Gon and Kilua	2025-05-08 13:35:36.155+00	\N	\N	\N	kikky-art-studio--hxh-gon-and-kilua	f	Custom Canvas Art | Kikky Art Studio- HxH Gon and Kilua	Stunning hand-painted canvas artwork featuring Gon Freecss and Killua Zoldyck from Hunter x Hunter. 	2025-05-08 13:35:37.052+00	2025-05-08 13:35:37.052+00	published
4	Transforming Scars Into Stunning Tattoo Art	2025-05-08 12:42:13.416+00	\N	\N	\N	transforming-scars-into-stunning-tattoo-art	f	Transforming Scars Into Stunning Tattoo Art-Kikky art	This expertly crafted cover-up tattoo seamlessly blends a detailed compass rose and a roman numeral timepiece to transform and conceal scars .	2025-05-08 13:36:07.853+00	2025-05-08 12:42:14.275+00	published
6	Urban Street Art Mural – Vibrant Cityscape on Container Wall	2025-05-08 13:41:29.185+00	\N	\N	\N	urban-street-art-mural--vibrant-cityscape-on-container-wall	f	Urban Street Art Mural – Vibrant Cityscape on Container Wall	Experience the essence of city nightlife through this captivating urban street art mural featuring a cityscape with glowing lights and  skyscrapers.	2025-05-08 13:41:30.095+00	2025-05-08 13:41:30.095+00	published
7	Neon Glow Portrait  – Afrocentric Expressionism on Canvas	2025-05-08 13:45:29.495+00	\N	\N	\N	neon-glow-portrait---afrocentric-expressionism-on-canvas	f	Neon Glow Portrait  – Afrocentric Expressionism on Canvas	Illuminate your space with this powerful Afrocentric portrait, painted in a unique blend of neon hues and expressive brushwork.	2025-05-08 13:45:30.41+00	2025-05-08 13:45:30.41+00	published
8	Batman Forearm Tattoo – Dark Knight Black Ink Design	2025-05-08 13:48:27.657+00	\N	\N	\N	batman-forearm-tattoo--dark-knight-black-ink-design	f	Batman Forearm Tattoo – Dark Knight Black Ink Design	Featuring detailed linework and bold shading, this black ink design brings the iconic Dark Knight to life with a fierce and artistic edge	2025-05-08 14:23:16.787+00	2025-05-08 13:48:28.57+00	published
\.
COPY public.products_blocks_archive (_order, _parent_id, _path, id, intro_content, "populateBy", "relationTo", "limit", populated_docs_total, block_name) FROM stdin;
\.
COPY public.products_blocks_content (_order, _parent_id, _path, id, invert_background, block_name) FROM stdin;
1	5	layout	681cb328aa58c90e08bcfdca	\N	\N
1	4	layout	681ca6a5aa58c90e08bcfdc9	\N	\N
1	6	layout	681cb489aa58c90e08bcfdcc	\N	\N
1	7	layout	681cb579aa58c90e08bcfdcd	\N	\N
\.
COPY public.products_blocks_content_columns (_order, _parent_id, id, size, rich_text, enable_link, link_type, link_new_tab, link_url, link_label, link_appearance) FROM stdin;
\.
COPY public.products_blocks_cta (_order, _parent_id, _path, id, invert_background, rich_text, block_name) FROM stdin;
\.
COPY public.products_blocks_cta_links (_order, _parent_id, id, link_type, link_new_tab, link_url, link_label, link_appearance) FROM stdin;
\.
COPY public.products_blocks_media_block (_order, _parent_id, _path, id, invert_background, "position", block_name) FROM stdin;
\.
COPY public.products_rels (id, "order", parent_id, path, pages_id, media_id, categories_id, products_id) FROM stdin;
20	1	5	categories	\N	\N	4	\N
21	\N	5	meta.image	\N	32	\N	\N
22	1	4	categories	\N	\N	5	\N
23	\N	4	meta.image	\N	31	\N	\N
24	1	6	categories	\N	\N	4	\N
25	\N	6	meta.image	\N	33	\N	\N
26	1	7	categories	\N	\N	4	\N
27	\N	7	meta.image	\N	34	\N	\N
33	1	8	categories	\N	\N	5	\N
34	1	8	relatedProducts	\N	\N	\N	4
35	\N	8	meta.image	\N	35	\N	\N
\.
COPY public.redirects (id, "from", to_type, to_url, updated_at, created_at) FROM stdin;
\.
COPY public.redirects_rels (id, "order", parent_id, path, pages_id, products_id) FROM stdin;
\.
COPY public.settings (id, updated_at, created_at) FROM stdin;
1	2025-05-07 06:27:04.533+00	\N
\.
COPY public.settings_rels (id, "order", parent_id, path, pages_id) FROM stdin;
1	\N	1	productsPage	1
\.
COPY public.users (id, name, stripe_customer_i_d, skip_sync, updated_at, created_at, email, reset_password_token, reset_password_expiration, salt, hash, login_attempts, lock_until) FROM stdin;
1	kikkyart@gmail	\N	\N	2025-05-08 14:57:47.12+00	2025-05-07 06:23:11.263+00	kikkyart@gmail.com	\N	\N	126f62f9ad91b6574fb2ca25183c9d4f26b775e87eacfce010a09bc9fc22bea0	52b336d8a0fc3cda3acf309f85145f6a8a51ff0b5bccc343cc1f9aa1319d2f5601c6b499124711997b65f5fd3b8df39bf553520f8118d35574bbbdcd323123e1832410ba9a84c1ce9b36485da64439d6dfca7b20a495c813983010e7826615fe00ccf8cc8a60954613c489b1113bb8094f3e189bdf931e06865eaa23d434c0ea9cd66a4a126506780875249c567cf39f3ff6afd37a7dc632314fd2c716ee92e94871c563717d3bcbb0510ec4260f604a9b89f3f387f3aca3f4b09358697a0816bee5408555fa9bcae0c412b132b767bbcf64e03ecc968c25927d907ed7aa48672283cb0ea0f934f6bfb89be041069c5991ca306ad77f0080b12cfa2d9333646cc30d8109addd2ffc8b2f1f901723428fa42cec454e1978a948f1a60d9d5c10655fd32d8c32772a97ef843ff75c53545313852809abe8cc7b6217dc9a9be159655cb769ee287fe5f21c6586ea72f9f0ffc308249d7792307d2c7b8a8b46cdcc8c757ecba4e739f1e617dfa79cbbb7cc3fa1ee30bebe6b6d152f86e54294f6e6c1a6d789137f4754c833146cbd5dc0266f7e898f29a04876a8ce8316831b7c964e3ecfb13d5d6dee1078477f6c22ab418e58c5bb0d0e3d41e6f07a6e3c76622b6615c1dde5bc0e62db4d70cd4deaf99cf9e367d2e4eb543464fadba74d4c94ac71023ec8e226b9afb72137be92494f14a4f8301a64e0be866e2b5db487467d08e8	0	\N
\.
COPY public.users_cart_items (_order, _parent_id, id, quantity) FROM stdin;
1	1	681cc66b817a134814fea1e3	1
\.
COPY public.users_rels (id, "order", parent_id, path, products_id) FROM stdin;
1	\N	1	cart.items.0.product	7
\.
COPY public.users_roles ("order", parent_id, value, id) FROM stdin;
1	1	customer	447
2	1	admin	448
\.

COMMIT;