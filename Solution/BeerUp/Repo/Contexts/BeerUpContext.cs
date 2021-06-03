using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

#nullable disable

namespace Repo.Modeles.ModelesBeerUp
{
    public partial class BeerUpContext : DbContext
    {
        public BeerUpContext()
        {
        }

        public BeerUpContext(DbContextOptions<BeerUpContext> options)
            : base(options)
        {
        }
        public virtual DbSet<AchatBieresFacture> AchatsBieresFacture { get; set; }
        public virtual DbSet<AchatEtabFacture> AchatsEtabFacture { get; set; }
        public virtual DbSet<AchatsVue> AchatsVues { get; set; }
        public virtual DbSet<AdressesFacturation> AdressesFacturations { get; set; }
        public virtual DbSet<AvisBiereUser> AvisBiereUser { get; set; }

        public virtual DbSet<AvisMoyen> AvisMoyens { get; set; }
        public virtual DbSet<Biere> Bieres { get; set; }
        public virtual DbSet<BiereDescr> BieresDescr { get; set; }
        public virtual DbSet<Etablissement> Etablissements { get; set; }
        public virtual DbSet<Facture> Factures { get; set; }
        public virtual DbSet<LibrairieUserBiere> LibrairieUserBieres { get; set; }
        public virtual DbSet<Organisation> Organisations { get; set; }
        public virtual DbSet<TarifsVueBie> TarifsVueBies { get; set; }
        public virtual DbSet<TarifsVueEtab> TarifsVueEtabs { get; set; }
        public virtual DbSet<Transaction> Transactions { get; set; }
        public virtual DbSet<TypesBiere> TypesBieres { get; set; }
        public virtual DbSet<TypesEtablissement> TypesEtablissements { get; set; }
        public virtual DbSet<TypesService> TypesServices { get; set; }
        public virtual DbSet<VenteBiereEtum> VenteBiereEta { get; set; }

        public virtual DbSet<VueAchatsBiere> VueAchatsBiere { get; set; }
        public virtual DbSet<VueAchatsEtab> VueAchatsEtab { get; set; }

        public virtual DbSet<Horaire> Horaires { get; set; }

        public virtual DbSet<JourFermeture> JoursFermeture { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("Relational:Collation", "French_CI_AS");

            modelBuilder.Entity<Transaction>(entity =>
            {
                entity.HasKey(t => t.TransId);

                entity.Property(t => t.TransId)
                   .HasColumnName("Trans.Id")
                   .HasDefaultValueSql("(newid())");

                entity.Property(t => t.OrgId).HasColumnName("Org.Id")
                    .IsRequired();

                entity.Property(t => t.StripeId).HasColumnName("Stripe.Id");

                entity.Property(t => t.TransStatus).HasColumnName("Trans.Status")
                    .IsRequired();

                entity.Property(t => t.TransDate).HasColumnName("Trans.Date")
                    .HasColumnType("datetime")
                    .IsRequired();

                entity.HasOne(d => d.Orga)
                    .WithMany(p => p.Transactions)
                    .HasForeignKey(d => d.OrgId)
                    .HasConstraintName("FK_Transactions_Organisations");

            });

            modelBuilder.Entity<VueAchatsEtab>(entity =>
            {
                entity.HasKey(v => v.Id);

                entity.Property(v => v.Id)
                   .HasColumnName("EtaId");

                entity.Property(v => v.NbVu).HasColumnName("EtaNbVu");

                entity.Property(v => v.Nom).HasColumnName("EtaNom");

                entity.Property(v => v.NbVuesAch).HasColumnName("TVEVueAch");

            });

            modelBuilder.Entity<AchatBieresFacture>(entity =>
            {
                entity.HasKey(a => a.AchId);

                entity.Property(a => a.AchId).HasColumnName("Ach.Id");

                entity.Property(a => a.OrgId).HasColumnName("Org.Id");

                entity.Property(a => a.FacId).HasColumnName("Fac.Id");

                entity.Property(a => a.BieNom).HasColumnName("Bie.Nom");

                entity.Property(a => a.BieNbVuAch).HasColumnName("BieNbVuAch");

                entity.Property(a => a.BiePrix).HasColumnName("BiePrix");


            });

            modelBuilder.Entity<AchatEtabFacture>(entity =>
            {
                entity.HasKey(a => a.AchId);

                entity.Property(a => a.AchId).HasColumnName("Ach.Id");

                entity.Property(a => a.OrgId).HasColumnName("Org.Id");

                entity.Property(a => a.FacId).HasColumnName("Fac.Id");

                entity.Property(a => a.EtaNom).HasColumnName("Eta.Nom");

                entity.Property(a => a.EtaNbVuAch).HasColumnName("EtaNbVuAch");

                entity.Property(a => a.EtaPrix).HasColumnName("EtaPrix");

            });



            modelBuilder.Entity<VueAchatsBiere>(entity =>
            {
                entity.HasKey(v => v.Id);

                entity.Property(v => v.Id)
                   .HasColumnName("BieId");

                entity.Property(v => v.NbVu).HasColumnName("BieNbVu");

                entity.Property(v => v.Nom).HasColumnName("BieNom");

                entity.Property(v => v.NbVuesAch).HasColumnName("TVBVueAch");

            });

            modelBuilder.Entity<AchatsVue>(entity =>
            {
                entity.HasKey(e => e.AchId);

                entity.Property(e => e.AchId)
                    .HasColumnName("Ach.Id")
                    .HasDefaultValueSql("(newid())");

                entity.Property(e => e.BieId).HasColumnName("Bie.Id");

                entity.Property(e => e.EtaId).HasColumnName("Eta.Id");

                entity.Property(e => e.TransId).HasColumnName("Trans.Id");

                entity.Property(e => e.TarifsVueBieId).HasColumnName("TarifsVueBie.Id");

                entity.Property(e => e.TarifsVueEtabId).HasColumnName("TarifsVueEtab.Id");

                entity.HasOne(d => d.Bie)
                    .WithMany(p => p.AchatsVues)
                    .HasForeignKey(d => d.BieId)
                    .HasConstraintName("FK_AchatsVues_Bieres");

                entity.HasOne(d => d.Eta)
                    .WithMany(p => p.AchatsVues)
                    .HasForeignKey(d => d.EtaId)
                    .HasConstraintName("FK_AchatsVues_Etablissements");

                entity.HasOne(d => d.Trans)
                    .WithMany(p => p.AchatsVues)
                    .HasForeignKey(d => d.TransId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_AchatsVues_Transactions");

                entity.HasOne(d => d.TarifsVueBie)
                    .WithMany(p => p.AchatsVues)
                    .HasForeignKey(d => d.TarifsVueBieId)
                    .HasConstraintName("FK_AchatsVues_TarifsVueBie");

                entity.HasOne(d => d.TarifsVueEtab)
                    .WithMany(p => p.AchatsVues)
                    .HasForeignKey(d => d.TarifsVueEtabId)
                    .HasConstraintName("FK_AchatsVues_TarifsVueEtab");
            });

            modelBuilder.Entity<AdressesFacturation>(entity =>
            {
                entity.HasKey(e => e.AdrFacId);

                entity.ToTable("AdressesFacturation");

                entity.Property(e => e.AdrFacId)
                    .HasColumnName("AdrFac.Id")
                    .HasDefaultValueSql("(newid())");

                entity.Property(e => e.AdrFacCp)
                    .HasMaxLength(50)
                    .HasColumnName("AdrFac.CP");

                entity.Property(e => e.AdrFacDateAjout)
                    .HasColumnType("datetime")
                    .HasColumnName("AdrFac.DateAjout");

                entity.Property(e => e.AdrFacNum)
                    .HasMaxLength(50)
                    .HasColumnName("AdrFac.Num");

                entity.Property(e => e.AdrFacPays)
                    .HasMaxLength(50)
                    .HasColumnName("AdrFac.Pays");

                entity.Property(e => e.AdrFacRue)
                    .HasMaxLength(200)
                    .HasColumnName("AdrFac.Rue");

                entity.Property(e => e.AdrFacVil)
                    .HasMaxLength(100)
                    .HasColumnName("AdrFac.Vil");

                entity.Property(e => e.OrgId).HasColumnName("Org.Id");

                entity.HasOne(d => d.Org)
                    .WithMany(p => p.AdressesFacturation)
                    .HasForeignKey(d => d.AdrFacId)
                    .HasConstraintName("FK_AdressesFacturation_Organisations");
            });


            modelBuilder.Entity<AvisBiereUser>(entity =>
            {
                entity.HasKey(e => e.AviBieUserId);

                entity.ToTable("AvisBiereUser");

                entity.Property(e => e.AviBieUserId)
                    .HasColumnName("AviBieUser.Id")
                    .HasDefaultValueSql("(newid())");

                entity.Property(e => e.AviBieUserActif).HasColumnName("AviBieUser.Actif");

                entity.Property(e => e.AviBieUserDateAvis)
                    .HasColumnType("datetime")
                    .HasColumnName("AviBieUser.DateAvis");

                entity.Property(e => e.BieId).HasColumnName("Bie.Id");

                entity.Property(e => e.UserId).HasColumnName("User.Id");

                entity.Property(e => e.OrgId).HasColumnName("Org.Id");

                entity.Property(e => e.AvisAcid).HasColumnName("Avis.Acid");

                entity.Property(e => e.AvisAmer).HasColumnName("Avis.Amer");

                entity.Property(e => e.AvisCafe).HasColumnName("Avis.Cafe");

                entity.Property(e => e.AvisCara).HasColumnName("Avis.Cara");

                entity.Property(e => e.AvisFruit).HasColumnName("Avis.Fruit");

                entity.Property(e => e.AvisHoub).HasColumnName("Avis.Houb");

                entity.Property(e => e.AvisMalt).HasColumnName("Avis.Malt");

                entity.Property(e => e.AvisNoteGlob).HasColumnName("Avis.NoteGlob");

                entity.Property(e => e.AvisSucr).HasColumnName("Avis.Sucr");

                entity.HasOne(d => d.Bie)
                    .WithMany(p => p.AvisBiereUsers)
                    .HasForeignKey(d => d.BieId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_AvisBiereUser_Bieres");
            });

            modelBuilder.Entity<AvisMoyen>(entity =>
            {
                entity.HasKey(a => a.BieId);

                entity.Property(e => e.BieId).HasColumnName("Bie.Id");

                entity.Property(a => a.AcidMoyen).HasColumnName("AcidMoyen");

                entity.Property(a => a.AmerMoyen).HasColumnName("AmerMoyen");

                entity.Property(a => a.CafeMoyen).HasColumnName("CafeMoyen");

                entity.Property(a => a.CaraMoyen).HasColumnName("CaraMoyen");

                entity.Property(a => a.FruitMoyen).HasColumnName("FruitMoyen");

                entity.Property(a => a.HoubMoyen).HasColumnName("HoubMoyen");

                entity.Property(a => a.MaltMoyen).HasColumnName("MaltMoyen");

                entity.Property(a => a.SucrMoyen).HasColumnName("SucrMoyen");

                entity.Property(a => a.NoteMoyen).HasColumnName("NoteMoyen");


            });

            modelBuilder.Entity<Biere>(entity =>
            {
                entity.HasKey(e => e.BieId);

                entity.Property(e => e.BieId)
                    .ValueGeneratedNever()
                    .HasColumnName("Bie.Id");

                entity.Property(e => e.BieActif).HasColumnName("Bie.Actif");

                entity.Property(e => e.BieDateCre)
                    .HasColumnType("datetime")
                    .HasColumnName("Bie.DateCre");

                entity.Property(e => e.BieDesc)
                    .HasMaxLength(1000)
                    .HasColumnName("Bie.Desc");

                entity.Property(e => e.BieNbVu).HasColumnName("Bie.NbVu");

                entity.Property(e => e.BieNom)
                    .IsRequired()
                    .HasMaxLength(100)
                    .HasColumnName("Bie.Nom");

                entity.Property(e => e.BiePhoto)
                    .HasMaxLength(200)
                    .HasColumnName("Bie.Photo");

                entity.Property(e => e.BieDegreAlcool)
                    .HasColumnName("Bie.DegreAlcool");

                entity.Property(e => e.BieValide).HasColumnName("Bie.Valide");

                entity.Property(e => e.EtaId).HasColumnName("Eta.Id");

                entity.Property(e => e.TypBieId).HasColumnName("TypBie.Id");

                entity.Property(e => e.UserId).HasColumnName("User.Id");

                entity.HasOne(d => d.Eta)
                    .WithMany(p => p.Bieres)
                    .HasForeignKey(d => d.EtaId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Bieres_Etablissements");

                entity.HasOne(d => d.TypBie)
                    .WithMany(p => p.Bieres)
                    .HasForeignKey(d => d.TypBieId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Bieres_TypesBiere");
            });

            modelBuilder.Entity<BiereDescr>(entity =>
            {
                entity.HasKey(e => e.BieId);

                entity.Property(e => e.BieId)
                    .ValueGeneratedNever()
                    .HasColumnName("Bie.Id");

                entity.Property(e => e.BieActif).HasColumnName("Bie.Actif");

                entity.Property(e => e.BieDateCre)
                    .HasColumnType("datetime")
                    .HasColumnName("Bie.DateCre");

                entity.Property(e => e.BieDesc)
                    .HasMaxLength(1000)
                    .HasColumnName("Bie.Desc");

                entity.Property(e => e.BieNbVu).HasColumnName("Bie.NbVu");

                entity.Property(e => e.NoteMoyen).HasColumnName("NoteMoyen");

                entity.Property(e => e.BieNom)
                    .IsRequired()
                    .HasMaxLength(100)
                    .HasColumnName("Bie.Nom");

                entity.Property(e => e.BiePhoto)
                    .HasMaxLength(200)
                    .HasColumnName("Bie.Photo");

                entity.Property(e => e.BieDegreAlcool)
                    .HasColumnName("Bie.DegreAlcool");

                entity.Property(e => e.BieValide).HasColumnName("Bie.Valide");

                entity.Property(e => e.EtaId).HasColumnName("Eta.Id");

                entity.Property(e => e.TypBieId).HasColumnName("TypBie.Id");

                entity.Property(e => e.UserId).HasColumnName("User.Id");

                entity.Property(e => e.TypBieId).HasColumnName("TypBie.Id");

                entity.Property(e => e.EtaNom).HasColumnName("Eta.Nom");

                entity.Property(e => e.TypBieNom).HasColumnName("TypBie.Nom");

            });

            modelBuilder.Entity<Etablissement>(entity =>
            {
                entity.HasKey(e => e.EtaId);

                entity.Property(e => e.EtaId)
                    .HasColumnName("Eta.Id")
                    .HasDefaultValueSql("(newid())");

                entity.Property(e => e.EtaActif)
                    .HasColumnName("Eta.Actif");

                entity.Property(e => e.EtaCoordLong)
                    .HasMaxLength(100)
                    .HasColumnName("Eta.CoordLong");

                entity.Property(e => e.EtaCoordLat)
                    .HasMaxLength(100)
                    .HasColumnName("Eta.CoordLat");

                entity.Property(e => e.EtaCp)
                    .HasMaxLength(50)
                    .HasColumnName("Eta.CP");

                entity.Property(e => e.EtaEmail)
                    .HasMaxLength(100)
                    .HasColumnName("Eta.Email");

                entity.Property(e => e.EtaNbVu).HasColumnName("Eta.NbVu");

                entity.Property(e => e.EtaNom)
                    .IsRequired()
                    .HasMaxLength(200)
                    .HasColumnName("Eta.Nom");

                entity.Property(e => e.EtaNum)
                    .HasMaxLength(50)
                    .HasColumnName("Eta.Num");

                entity.Property(e => e.EtaPhoto)
                    .HasMaxLength(200)
                    .HasColumnName("Eta.Photo");

                entity.Property(e => e.EtaRue)
                    .HasMaxLength(200)
                    .HasColumnName("Eta.Rue");

                entity.Property(e => e.EtaTva)
                    .HasMaxLength(50)
                    .HasColumnName("Eta.Tva");

                entity.Property(e => e.EtaVille)
                    .HasMaxLength(100)
                    .HasColumnName("Eta.Ville");

                entity.Property(e => e.EtaPays)
                    .HasMaxLength(100)
                    .HasColumnName("Eta.Pays");

                entity.Property(e => e.EtaWeb)
                    .HasMaxLength(100)
                    .HasColumnName("Eta.Web");

                entity.Property(e => e.OrgId).HasColumnName("Org.Id");

                entity.Property(e => e.TypEtaId).HasColumnName("TypEta.Id");

                entity.HasOne(d => d.Org)
                    .WithMany(p => p.Etablissements)
                    .HasForeignKey(d => d.OrgId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Etablissements_Organisations");

                entity.HasOne(d => d.TypEta)
                    .WithMany(p => p.Etablissements)
                    .HasForeignKey(d => d.TypEtaId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Etablissements_TypesEtablissement");
            });

            modelBuilder.Entity<Facture>(entity =>
            {
                entity.HasKey(e => e.FacId);

                entity.Property(e => e.FacId).HasColumnName("Fac.Id");

                entity.Property(e => e.TransId).HasColumnName("Trans.Id")
                    .IsRequired();

                entity.Property(e => e.AdrFacId).HasColumnName("AdrFac.Id")
                    .IsRequired();

                entity.Property(e => e.FacMotif).HasColumnName("Fac.Motif");

                entity.Property(e => e.FacDate)
                    .HasColumnType("datetime")
                    .HasColumnName("Fac.Date");

                entity.HasOne(d => d.Adresse)
                    .WithMany(p => p.Factures)
                    .HasForeignKey(d => d.AdrFacId)
                    .HasConstraintName("FK_Factures_AdressesFacturation");

            });



            modelBuilder.Entity<LibrairieUserBiere>(entity =>
            {
                entity.HasKey(e => new { e.BieId, e.UserId });

                entity.Property(e => e.BieId).HasColumnName("Bie.Id");

                entity.Property(e => e.UserId).HasColumnName("User.Id");

                entity.HasOne(d => d.Bie)
                    .WithMany(p => p.LibrairieUserBieres)
                    .HasForeignKey(d => d.BieId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_LibrairieUserBieres_Bieres");
            });

            modelBuilder.Entity<Organisation>(entity =>
            {
                entity.HasKey(e => e.OrgId);

                entity.Property(e => e.OrgId)
                    .HasColumnName("Org.Id")
                    .HasDefaultValueSql("(newid())");

                entity.Property(e => e.OrgCp)
                    .HasMaxLength(50)
                    .HasColumnName("Org.CP");

                entity.Property(e => e.OrgEmail)
                    .HasMaxLength(100)
                    .HasColumnName("Org.Email");

                entity.Property(e => e.OrgNom)
                    .HasMaxLength(200)
                    .HasColumnName("Org.Nom");

                entity.Property(e => e.OrgNum)
                    .HasMaxLength(50)
                    .HasColumnName("Org.Num");

                entity.Property(e => e.OrgPays)
                    .HasMaxLength(50)
                    .HasColumnName("Org.Pays");

                entity.Property(e => e.OrgPhoto)
                    .HasMaxLength(200)
                    .HasColumnName("Org.Photo");

                entity.Property(e => e.OrgRue)
                    .HasMaxLength(200)
                    .HasColumnName("Org.Rue");

                entity.Property(e => e.OrgTva)
                    .HasMaxLength(50)
                    .HasColumnName("Org.Tva");

                entity.Property(e => e.OrgVille)
                    .HasMaxLength(100)
                    .HasColumnName("Org.Ville");

                entity.Property(e => e.OrgWeb)
                    .HasMaxLength(100)
                    .HasColumnName("Org.Web");
            });

            modelBuilder.Entity<TarifsVueBie>(entity =>
            {
                entity.ToTable("TarifsVueBie");

                entity.Property(e => e.Id)
                    .HasColumnName("TarifsVueBie.Id")
                    .HasDefaultValueSql("(newid())");

                entity.Property(e => e.Actif)
                    .HasColumnName("TarifsVueBie.Actif");

                entity.Property(e => e.DateDebut)
                    .HasColumnType("datetime")
                    .HasColumnName("TarifsVueBie.DateDebut");

                entity.Property(e => e.DateFin)
                    .HasColumnType("datetime")
                    .HasColumnName("TarifsVueBie.DateFin");

                entity.Property(e => e.NbVue).HasColumnName("TarifsVueBie.NbVue");

                entity.Property(e => e.Prix)
                    .HasColumnType("decimal(8, 2)")
                    .HasColumnName("TarifsVueBie.Prix");
            });

            modelBuilder.Entity<TarifsVueEtab>(entity =>
            {
                entity.ToTable("TarifsVueEtab");

                entity.Property(e => e.Id)
                    .HasColumnName("TarifsVueEtab.Id")
                    .HasDefaultValueSql("(newid())");

                entity.Property(e => e.Actif).HasColumnName("TarifsVueEtab.Actif");

                entity.Property(e => e.DateDebut)
                    .HasColumnType("datetime")
                    .HasColumnName("TarifsVueEtab.DateDebut");

                entity.Property(e => e.DateFin)
                    .HasColumnType("datetime")
                    .HasColumnName("TarifsVueEtab.DateFin");

                entity.Property(e => e.NbVue).HasColumnName("TarifsVueEtab.NbVue");

                entity.Property(e => e.Prix)
                    .HasColumnType("decimal(8, 2)")
                    .HasColumnName("TarifsVueEtab.Prix");
            });


            modelBuilder.Entity<TypesBiere>(entity =>
            {
                entity.HasKey(e => e.TypBieId);

                entity.ToTable("TypesBiere");

                entity.HasIndex(e => e.TypBieNom, "IX_TypesBiere.Nom")
                    .IsUnique();

                entity.Property(e => e.TypBieId)
                    .ValueGeneratedNever()
                    .HasColumnName("TypBie.Id");

                entity.Property(e => e.TypBieNom)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasColumnName("TypBie.Nom");
            });

            modelBuilder.Entity<TypesEtablissement>(entity =>
            {
                entity.HasKey(e => e.TypEtaId);

                entity.ToTable("TypesEtablissement");

                entity.HasIndex(e => e.TypEtaNom, "IX_TypEta.Nom")
                    .IsUnique();

                entity.Property(e => e.TypEtaId)
                    .HasColumnName("TypEta.Id")
                    .HasDefaultValueSql("(newid())");

                entity.Property(e => e.TypEtaNom)
                    .IsRequired()
                    .HasMaxLength(100)
                    .HasColumnName("TypEta.Nom");
            });

            modelBuilder.Entity<TypesService>(entity =>
            {
                entity.HasKey(e => e.TypServId);

                entity.HasIndex(e => e.TypSerLibelle, "IX_TypesServices.Nom")
                    .IsUnique();

                entity.Property(e => e.TypServId)
                    .HasColumnName("TypServ.Id")
                    .HasDefaultValueSql("(newid())");

                entity.Property(e => e.TypSerLibelle)
                    .IsRequired()
                    .HasMaxLength(100)
                    .HasColumnName("TypSer.Libelle");
            });

            modelBuilder.Entity<VenteBiereEtum>(entity =>
            {
                entity.HasKey(e => e.VenteBiereEtaId);

                entity.Property(e => e.VenteBiereEtaId)
                    .HasColumnName("VenteBiereEta.Id")
                    .HasDefaultValueSql("(newid())");

                entity.Property(e => e.BieId).HasColumnName("Bie.Id");

                entity.Property(e => e.EtaId).HasColumnName("Eta.Id");

                entity.Property(e => e.TypServId).HasColumnName("TypServ.Id");

                entity.HasOne(d => d.Bie)
                    .WithMany(p => p.VenteBiereEta)
                    .HasForeignKey(d => d.BieId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_VenteBiereEta_Bieres1");

                entity.HasOne(d => d.Eta)
                    .WithMany(p => p.VenteBiereEta)
                    .HasForeignKey(d => d.EtaId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_VenteBiereEta_Etablissements");

                entity.HasOne(d => d.TypServ)
                    .WithMany(p => p.VenteBiereEta)
                    .HasForeignKey(d => d.TypServId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_VenteBiereEta_TypesServices");
            });

            modelBuilder.Entity<Horaire>(entity =>
            {
                entity.HasKey(e => e.HorId);

                entity.Property(e => e.HorId)
                    .HasColumnName("Hor.Id")
                    .HasDefaultValueSql("(newid())");

                entity.Property(e => e.EtaId).HasColumnName("Eta.Id");

                entity.Property(e => e.HorJour)
                    .HasColumnName("Hor.Jour")
                    .IsRequired()
                    .HasMaxLength(20);

                entity.Property(e => e.HorDebut)
                    .HasColumnName("Hor.Debut")
                    .HasColumnType("time");

                entity.Property(e => e.HorFin)
                    .HasColumnName("Hor.Fin")
                    .HasColumnType("time");

                entity.HasOne(d => d.Eta)
                    .WithMany(p => p.Horaires)
                    .HasForeignKey(d => d.EtaId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Horaires_Etablissements");
            });

            modelBuilder.Entity<JourFermeture>(entity =>
            {
                entity.HasKey(e => e.JouId);

                entity.Property(e => e.JouId)
                    .HasColumnName("Jou.Id")
                    .HasDefaultValueSql("(newid())");

                entity.Property(e => e.EtaId).HasColumnName("Eta.Id");


                entity.Property(e => e.JouDate)
                    .HasColumnName("Jou.Date")
                    .HasColumnType("datetime");

                entity.HasOne(d => d.Eta)
                    .WithMany(p => p.JoursFermeture)
                    .HasForeignKey(d => d.EtaId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_JoursFermeture_Etablissements");
            });


            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
