unit UAgronomoCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Menus, Db, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, ActnList, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, DBPanel;

type
  TFAgronomoCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    RelatriodeAgrnomos1: TMenuItem;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    DBPanel1: TDBPanel;
    DBPanel2: TDBPanel;
    cbTecnicoAgricola: TCheckBox;
    procedure FormActivate(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure RelatriodeAgrnomos1Click(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBPanel1DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure SBIncluirClick(Sender: TObject);
    procedure SBAlterarClick(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure SBCancelarClick(Sender: TObject);
    procedure cbTecnicoAgricolaClick(Sender: TObject);
  private
    { Private declarations }
    procedure CbTecnicoAgricolaAtivo;

  public
    { Public declarations }
  end;

var
  FAgronomoCad: TFAgronomoCad;

implementation

uses UAgronomo_cl, UAgronomoCons, URAgronomo, UFilialCons;

{$R *.DFM}

procedure TFAgronomoCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMAgronomo.QAgronomo.Open;

  CbTecnicoAgricolaAtivo;

end;

procedure TFAgronomoCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FAgronomoCons = nil then
     FAgronomoCons := TFAgronomoCons.Create(Application);
  If FAgronomoCons.ShowModal = mrOK then
     with DMAgronomo do
     begin
        QAgronomo.Close;
        QAgronomo.SetVariable('PK',QAgronomoConsCod_Agronomo.Value);
        QAgronomo.Open;        
        
        if QAgronomoIND_TECNICO.Value = 'SIM' then
        begin

          Label3.Caption := 'CFTA Registro';
          cbTecnicoAgricola.Checked := true;

        end
        else
        begin

          Label3.Caption := 'Código Crea';
          cbTecnicoAgricola.Checked := false;
          
        end;
     end;

end;

procedure TFAgronomoCad.RelatriodeAgrnomos1Click(Sender: TObject);
begin
  inherited;
  with DmAgronomo do
  begin
    QRAgronomo.Close;
    QRAgronomo.Open;
    If FRAgronomo = Nil then
       FRAgronomo := TFRAgronomo.Create(Application);
    FRAgronomo.QRPrimario.Preview;
    QRAgronomo.Close;
  end;

end;

procedure TFAgronomoCad.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext (23);
end;

procedure TFAgronomoCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMAgronomo.QAgronomo.Close;
  Action := CaFree;
  FAgronomoCad := Nil;
end;

procedure TFAgronomoCad.DBPanel1DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FFilialCons;
  Classe := TFFilialCons;

end;

procedure TFAgronomoCad.SBIncluirClick(Sender: TObject);
begin
  inherited;
  CbTecnicoAgricolaAtivo;

end;

procedure TFAgronomoCad.SBAlterarClick(Sender: TObject);
begin
  inherited;
  CbTecnicoAgricolaAtivo;

end;

procedure TFAgronomoCad.SBConfirmarClick(Sender: TObject);
begin
  inherited;
  CbTecnicoAgricolaAtivo;
end;

procedure TFAgronomoCad.SBCancelarClick(Sender: TObject);
begin
  inherited;
  CbTecnicoAgricolaAtivo;
end;

procedure TFAgronomoCad.CbTecnicoAgricolaAtivo;
begin

  if  DSPrimario.State in [dsinsert, dsedit] then
    cbTecnicoAgricola.Enabled := true
  else
    cbTecnicoAgricola.Enabled := false;

end;

procedure TFAgronomoCad.cbTecnicoAgricolaClick(Sender: TObject);
begin
  inherited;
  with DMAgronomo do
  begin

    if cbTecnicoAgricola.Checked then
    begin
      Label3.Caption := 'CFTA Registro';
      DBPanel2.LCaption  := 'TRT';
      QAgronomoIND_TECNICO.Value := 'SIM';
    end
    else
    begin
      Label3.Caption := 'Código Crea';
      DBPanel2.LCaption  := 'ART';
      QAgronomoIND_TECNICO.Value := 'NÃO';
    end;

  end;


end;

end.
