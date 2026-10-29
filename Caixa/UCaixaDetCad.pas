unit UCaixaDetCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Menus, Db, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, variants, ActnList, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFCaixaDetCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    BtFilial: TSpeedButton;
    BtDepartamento: TSpeedButton;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DetalhamentodeCaixa1: TMenuItem;
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BtFilialClick(Sender: TObject);
    procedure BtDepartamentoClick(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure DetalhamentodeCaixa1Click(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
    procedure SBExcluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBConfirmarClick(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCaixaDetCad: TFCaixaDetCad;

implementation

uses UCaixa_cl, UFilialCons, UFilial_cl, UDepartamentoCons,
  UDepartamento_cl, UCaixaDetCons, UCaixaDetParam, URCaixaDet, UTela_cl,
  UUsuario_cl, UOracle_cl, UCaixaRel_cl;

{$R *.DFM}

procedure TFCaixaDetCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  if DSPrimario.State in [dsinsert,dsedit] then
    begin
      BtFilial.Enabled:=True;
      BtDepartamento.Enabled:=True;
    end
  else
    begin
      BtFilial.Enabled:=False;
      BtDepartamento.Enabled:=False;
    end
end;

procedure TFCaixaDetCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMCaixa.QCaixaDet_Cad.Open;
end;

procedure TFCaixaDetCad.BtFilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal=MrOk then
    Begin
      With DMCaixa do
        begin
          QCaixaDet_CadCod_Filial.Value:=DMFilial.QFilialConsCod_Filial.Value;
          DMFilial.QFilialCons.Close;
        end;
    End;
end;

procedure TFCaixaDetCad.BtDepartamentoClick(Sender: TObject);
begin
  inherited;
  if FDepartamentoCons = Nil then
    FDepartamentoCons := TFDepartamentoCons.Create(Application);
  if FDepartamentoCons.ShowModal=MrOk then
    Begin
      With DMCaixa do
        begin
          QCaixaDet_CadCod_Departamento.Value:=DMDepartamento.QDepartamentoConsCod_Departamento.Value;
          DMDepartamento.QDepartamentoCons.Close;
        end;
    End;
end;

procedure TFCaixaDetCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FCaixaDetCons = Nil then
    FCaixaDetCons:=TFCaixaDetCons.Create(Application);
  If FCaixaDetCons.ShowModal=mrOk then
    Begin
      DMCaixa.QCaixaDet_Cad.Close;
      DMCaixa.QCaixaDet_Cad.SetVariable('PK',DMCaixa.QCaixaDet_ConsCod_Caixa_Det.Value);
      DMCaixa.QCaixaDet_Cad.Open;
      DMCaixa.QCaixaDet_Cons.Close;
    End;
end;

procedure TFCaixaDetCad.DetalhamentodeCaixa1Click(Sender: TObject);
begin
  inherited;
  if FCaixaDetParam = Nil then
    FCaixaDetParam:=TFCaixaDetParam.Create(Application);
  FCaixaDetParam.PGRelatorio.Pages[0].TabVisible:=True;
  if FCaixaDetParam.ShowModal=mrOk then
  begin
    DmUsuario.Checar_Filial_Usuario(FCaixaDetParam.MECodFilial.Text,'CAIXA');
      with DMCaixaRel do
        begin
          QRCaixaDet.Close;
          If Trim(FCaixaDetParam.MECodFilial.text)<>'' then
            QRCaixaDet.SetVariable('COD_FILIAL',StrToInt(Trim(FCaixaDetParam.MECodFilial.text)))
          Else
            QRCaixaDet.SetVariable('COD_FILIAL',Null);

          If Trim(FCaixaDetParam.MECodDepto.Text) <> '' then
            QRCaixaDet.SetVariable('COD_DEPARTAMENTO', Trim(FCaixaDetParam.MECodDepto.Text))
          else
            QRCaixaDet.SetVariable('COD_DEPARTAMENTO', null);

          QRCaixaDet.SetVariable('DT_INICIAL',FCaixaDetParam.MEDtInicial.text);
          QRCaixaDet.SetVariable('DT_FINAL',FCaixaDetParam.MEDtFinal.text);

          QRCaixaDet.Open;

          if FRCaixaDet = Nil then
            FRCaixaDet:=TFRCaixaDet.Create(Application);
          FRCaixaDet.QRLPeriodo.Caption:='Periodo de: '+FCaixaDetParam.MEDtInicial.text+' até: '+FCaixaDetParam.MEDtFinal.text;
          If FCaixaDetParam.RGPreview.ItemIndex=0 then
            FRCaixaDet.QRPrimario.Preview
          Else
            FRCaixaDet.QRPrimario.Print;
          QRCaixaDet.Close;
        end;
    end;
end;

procedure TFCaixaDetCad.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext (8);
end;

procedure TFCaixaDetCad.SBExcluirClick(Sender: TObject);
begin
//  inherited;
  if not DMOracle.DBCemapa.InTransaction then
     DMOracle.DBCemapa.StartTransaction;

  try
    DSPrimario.DataSet.Delete;
    DMOracle.DBCemapa.Commit;
  except
    raise exception.Create('Não foi possivel excluir registro!');
  end;
  
end;

procedure TFCaixaDetCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMCaixa.QCaixaDet_Cad.Open;
  Action := CaFree;
  FCaixaDetCad := Nil;
end;

procedure TFCaixaDetCad.SBConfirmarClick(Sender: TObject);
begin
  DmUsuario.Checar_Filial_Usuario(DMCaixa.QCaixaDet_CadCOD_FILIAL.Text,'CAIXA');
  inherited;
end;

procedure TFCaixaDetCad.DBEdit2Exit(Sender: TObject);
begin
  inherited;
  DMOracle.ValidaFilial(DBEdit2.Text);
end;

end.
