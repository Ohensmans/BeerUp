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

        public virtual DbSet<AchatsVue> AchatsVues { get; set; }
        public virtual DbSet<AdressesFacturation> AdressesFacturations { get; set; }
        public virtual DbSet<Avis> Avis { get; set; }
        public virtual DbSet<AvisBiereUser> AvisBiereUsers { get; set; }
        public virtual DbSet<Biere> Bieres { get; set; }
        public virtual DbSet<Etablissement> Etablissements { get; set; }
        public virtual DbSet<Facture> Factures { get; set; }
        public virtual DbSet<FactureOrgaAdresse> FactureOrgaAdresses { get; set; }
        public virtual DbSet<LibrairieUserBiere> LibrairieUserBieres { get; set; }
        public virtual DbSet<Organisation> Organisations { get; set; }
        public virtual DbSet<TarifsVueBie> TarifsVueBies { get; set; }
        public virtual DbSet<TarifsVueEtab> TarifsVueEtabs { get; set; }
        public virtual DbSet<TypeServiceVenteBiere> TypeServiceVenteBieres { get; set; }
        public virtual DbSet<TypesBiere> TypesBieres { get; set; }
        public virtual DbSet<TypesEtablissement> TypesEtablissements { get; set; }
        public virtual DbSet<TypesService> TypesServices { get; set; }
        public virtual DbSet<VenteBiereEtum> VenteBiereEta { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("Relational:Collation", "French_CI_AS");

            modelBuilder.Entity<AchatsVue>(entity =>
            {
                entity.HasKey(e => e.AchId);

                entity.Property(e => e.AchId)
                    .HasColumnName("Ach.Id")
                    .HasDefaultValueSql("(newid())");

                entity.Property(e => e.BieId).HasColumnName("Bie.Id");

                entity.Property(e => e.EtaId).HasColumnName("Eta.Id");

                entity.Property(e => e.FacId).HasColumnName("Fac.Id");

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

                entity.HasOne(d => d.Fac)
                    .WithMany(p => p.AchatsVues)
                    .HasForeignKey(d => d.FacId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_AchatsVues_Factures");

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
            });

            modelBuilder.Entity<Avis>(entity =>
            {
                entity.HasKey(e => e.AvisId);

                entity.Property(e => e.AvisId)
                    .HasColumnName("Avis.Id")
                    .HasDefaultValueSql("(newid())");

                entity.Property(e => e.AvisAcid).HasColumnName("Avis.Acid");

                entity.Property(e => e.AvisCafe).HasColumnName("Avis.Cafe");

                entity.Property(e => e.AvisCara).HasColumnName("Avis.Cara");

                entity.Property(e => e.AvisDateAvis)
                    .HasColumnType("datetime")
                    .HasColumnName("Avis.DateAvis");

                entity.Property(e => e.AvisFruit).HasColumnName("Avis.Fruit");

                entity.Property(e => e.AvisHoub).HasColumnName("Avis.Houb");

                entity.Property(e => e.AvisMalt).HasColumnName("Avis.Malt");

                entity.Property(e => e.AvisNoteGlob).HasColumnName("Avis.NoteGlob");

                entity.Property(e => e.AvisSucr).HasColumnName("Avis.Sucr");
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

                entity.Property(e => e.AvisId).HasColumnName("Avis.Id");

                entity.Property(e => e.BieId).HasColumnName("Bie.Id");

                entity.Property(e => e.UserId).HasColumnName("User.Id");

                entity.HasOne(d => d.Avis)
                    .WithMany(p => p.AvisBiereUsers)
                    .HasForeignKey(d => d.AvisId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_AvisBiereUser_Avis");

                entity.HasOne(d => d.Bie)
                    .WithMany(p => p.AvisBiereUsers)
                    .HasForeignKey(d => d.BieId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_AvisBiereUser_Bieres");
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

            modelBuilder.Entity<Etablissement>(entity =>
            {
                entity.HasKey(e => e.EtaId);

                entity.Property(e => e.EtaId)
                    .HasColumnName("Eta.Id")
                    .HasDefaultValueSql("(newid())");

                entity.Property(e => e.EtaActif)
                    .HasColumnName("Eta.Actif")
                    .HasComputedColumnSql("((1))", false);

                entity.Property(e => e.EtaCoord)
                    .HasMaxLength(100)
                    .HasColumnName("Eta.Coord");

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

                entity.Property(e => e.FacDate)
                    .HasColumnType("datetime")
                    .HasColumnName("Fac.Date");
            });

            modelBuilder.Entity<FactureOrgaAdresse>(entity =>
            {
                entity.HasKey(e => new { e.OrgId, e.FacId, e.AdrFacId });

                entity.ToTable("FactureOrgaAdresse");

                entity.Property(e => e.OrgId).HasColumnName("Org.Id");

                entity.Property(e => e.FacId).HasColumnName("Fac.Id");

                entity.Property(e => e.AdrFacId).HasColumnName("AdrFac.Id");

                entity.HasOne(d => d.AdrFac)
                    .WithMany(p => p.FactureOrgaAdresses)
                    .HasForeignKey(d => d.AdrFacId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_AdrFacturation");

                entity.HasOne(d => d.Fac)
                    .WithMany(p => p.FactureOrgaAdresses)
                    .HasForeignKey(d => d.FacId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Factures");

                entity.HasOne(d => d.Org)
                    .WithMany(p => p.FactureOrgaAdresses)
                    .HasForeignKey(d => d.OrgId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Organisations");
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

                entity.Property(e => e.TarifsVueBieId)
                    .HasColumnName("TarifsVueBie.Id")
                    .HasDefaultValueSql("(newid())");

                entity.Property(e => e.TarifsVueBieActif)
                    .HasColumnName("TarifsVueBie.Actif")
                    .HasComputedColumnSql("((1))", false);

                entity.Property(e => e.TarifsVueBieDateCre)
                    .HasColumnType("datetime")
                    .HasColumnName("TarifsVueBie.DateCre");

                entity.Property(e => e.TarifsVueBieNbVue).HasColumnName("TarifsVueBie.NbVue");

                entity.Property(e => e.TarifsVueBiePrix)
                    .HasColumnType("decimal(8, 2)")
                    .HasColumnName("TarifsVueBie.Prix");
            });

            modelBuilder.Entity<TarifsVueEtab>(entity =>
            {
                entity.ToTable("TarifsVueEtab");

                entity.Property(e => e.TarifsVueEtabId)
                    .HasColumnName("TarifsVueEtab.Id")
                    .HasDefaultValueSql("(newid())");

                entity.Property(e => e.TarifsVueEtabActif).HasColumnName("TarifsVueEtab.Actif");

                entity.Property(e => e.TarifsVueEtabDateCre)
                    .HasColumnType("datetime")
                    .HasColumnName("TarifsVueEtab.DateCre");

                entity.Property(e => e.TarifsVueEtabNbVue).HasColumnName("TarifsVueEtab.NbVue");

                entity.Property(e => e.TarifsVueEtabPrix)
                    .HasColumnType("decimal(8, 2)")
                    .HasColumnName("TarifsVueEtab.Prix");
            });

            modelBuilder.Entity<TypeServiceVenteBiere>(entity =>
            {
                entity.HasKey(e => new { e.VenteBiereEtaId, e.TypServiceId });

                entity.ToTable("TypeServiceVenteBiere");

                entity.Property(e => e.VenteBiereEtaId).HasColumnName("VenteBiereEta.Id");

                entity.Property(e => e.TypServiceId).HasColumnName("TypService.Id");

                entity.HasOne(d => d.TypService)
                    .WithMany(p => p.TypeServiceVenteBieres)
                    .HasForeignKey(d => d.TypServiceId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_TypeServiceVenteBiere_TypesServices");

                entity.HasOne(d => d.VenteBiereEta)
                    .WithMany(p => p.TypeServiceVenteBieres)
                    .HasForeignKey(d => d.VenteBiereEtaId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_TypeServiceVenteBiere_VenteBiereEta");
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
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
