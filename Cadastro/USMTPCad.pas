unit USMTPCad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, ActnList, ImgList, DB, Menus, ComCtrls, StdCtrls,
  Mask, ExtCtrls, Buttons, DBPanel, DBCtrls, UBiblioteca;

type
  TFSMTPCad = class(TFTCadSimples)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    GroupBox1: TGroupBox;
    DBPanel1: TDBPanel;
    DBPEmail: TDBPanel;
    DBPSenha: TDBPanel;
    DBPSMTP: TDBPanel;
    DBPanel4: TDBPanel;
    DBRadioGroup4: TDBRadioGroup;
    TabSheet2: TTabSheet;
    GroupBox2: TGroupBox;
    DBPanel5: TDBPanel;
    DBPanel6: TDBPanel;
    DBComboBox1: TDBComboBox;
    Label1: TLabel;
    DBPanel2: TDBPanel;
    GroupBox3: TGroupBox;
    DBPanel7: TDBPanel;
    DBPanel9: TDBPanel;
    procedure SBConsultaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSMTPCad: TFSMTPCad;

implementation
         
uses UMalaDireta_cl, USMTPCons, UTela_cl, UOracle_cl;

{$R *.dfm}

procedure TFSMTPCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FSMTPCons = nil then
    FSMTPCons := TFSMTPCons.Create(Application);
  if FSMTPCons.ShowModal = MrOk then
  begin
    MeLocaliza.Text := DMMalaDireta.QSMTPConsCOD_SMTP.Text;
    MELocalizaExit(Sender);
  end;
end;

procedure TFSMTPCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMMalaDireta.QSMTP.Open;
  DMTela.VerificaTela('CADASTRO', Self.Caption, Self.Name);
end;

procedure TFSMTPCad.FormCreate(Sender: TObject);
begin
  inherited;
  PageControl1.ActivePageIndex := 0;

  Bib.addControleCharCase(DBPEmail, Self.Name);
  Bib.addControleCharCase(DBPSMTP, Self.Name);
  Bib.addControleCharCase(DBPSenha, Self.Name);
end;

procedure TFSMTPCad.SBConfirmarClick(Sender: TObject);
begin
  inherited;
  try
    DMOracle.DBCemapa.Commit;
  except
    on E: Exception do
    begin
      DMOracle.DBCemapa.Rollback;
      raise Exception.Create(E.Message);
    end;
  end;
end;

end.
