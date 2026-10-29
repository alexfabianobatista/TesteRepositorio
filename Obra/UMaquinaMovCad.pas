unit UMaquinaMovCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, variants, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, ActnList;

type
  TFMaquinaMovCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    SBObra: TSpeedButton;
    EdObra: TEdit;
    SBOperador: TSpeedButton;
    EdOperador: TEdit;
    RelaodeMovimentosporMquina1: TMenuItem;
    procedure DBEdit3Exit(Sender: TObject);
    procedure DBEdit4Exit(Sender: TObject);
    procedure SBObraClick(Sender: TObject);
    procedure SBOperadorClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure SBIncluirClick(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure RelaodeMovimentosporMquina1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMaquinaMovCad: TFMaquinaMovCad;

implementation

uses UMaquinaMov_cl, UOracle_cl, UObraCons, UObra_cl, UCadastroCons,
  UCadastro_cl, UMaquinaMovCons, URMaquinaMov, UObra_Param;

{$R *.DFM}

procedure TFMaquinaMovCad.DBEdit3Exit(Sender: TObject);
begin
  inherited;
  if Trim(DMMaquinaMov.QMaquinaMovCadCOD_OBRA.Text) <> '' then
  begin
    EdObra.Text := DMOracle.BuscaNome('SELECT DESC_OBRA FROM TB_OBRA','COD_OBRA = '+DMMaquinaMov.QMaquinaMovCadCOD_OBRA.Text);
    if Trim(DMOracle.BuscaNome('SELECT IND_KM_HR FROM TB_OBRA','COD_OBRA = '+DMMaquinaMov.QMaquinaMovCadCOD_OBRA.Text)) = 'KM' then
    begin
      DMMaquinaMov.QMaquinaMovCadKM_INICIAL.Text := DMOracle.BuscaNome('SELECT VAL_MARCADOR FROM TB_OBRA','COD_OBRA = '+DMMaquinaMov.QMaquinaMovCadCOD_OBRA.Text);
      DBEdit7.Enabled := False;
      DBEdit6.Enabled := True;
      DBEdit5.Enabled := True;
    end
    else
    begin
      DBEdit7.Enabled := True;
      DBEdit6.Enabled := False;
      DBEdit5.Enabled := False;
    end;
  end
  else
  begin
    EdObra.Text := '';
    DBEdit5.Text := '';
    DBEdit7.Enabled := False;
    DBEdit6.Enabled := False;
    DBEdit5.Enabled := False;
  end;
end;

procedure TFMaquinaMovCad.DBEdit4Exit(Sender: TObject);
begin
  inherited;
  if Trim(DBEdit4.Text) <> '' then
    EdOperador.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+DBEdit4.Text)
  else
    EdOperador.Text := '';
end;

procedure TFMaquinaMovCad.SBObraClick(Sender: TObject);
begin
  inherited;
  if FObraCons = nil then
    FObraCons := TFObraCons.Create(Application);
  if FObraCons.showModal = mrOk then
  begin
    DMMaquinaMov.QMaquinaMovCadCOD_OBRA.Text := DMObra.QObra_consCOD_OBRA.Text;
    DBEdit3Exit(Self);
  end;
end;

procedure TFMaquinaMovCad.SBOperadorClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.showModal = mrOk then
  begin
    DBEdit4.Text := DMCadastro.QCadastroconsCOD_CADASTRO.Text;
    DBEdit4Exit(Self);
  end;
end;

procedure TFMaquinaMovCad.FormActivate(Sender: TObject);
begin
  inherited;
  DSPrimario.DataSet.Open;
end;

procedure TFMaquinaMovCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DSPrimario.DataSet.Close;
end;

procedure TFMaquinaMovCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  SBOperador.Enabled := SBCancelar.Enabled;
  SBObra.Enabled := SBCancelar.Enabled;
  DBEdit3Exit(Self);
  DBEdit4Exit(Self);
end;

procedure TFMaquinaMovCad.SBIncluirClick(Sender: TObject);
begin
  inherited;
  DBEdit3Exit(Self);
  DBEdit4Exit(Self);
end;

procedure TFMaquinaMovCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FMaquinaMovCons = nil then
    FMaquinaMovCons := TFMaquinaMovCons.Create(Application);
  if FMaquinaMovCons.showModal = mrOk then
  begin
    DSPrimario.DataSet.Close;
    DMMaquinaMov.QMaquinaMovCad.SetVariable('PK',DMMaquinaMov.QMaquinaMovConsCOD_MAQUINA_MOV.Text);
    DSPrimario.DataSet.Open;
  end;
end;

procedure TFMaquinaMovCad.RelaodeMovimentosporMquina1Click(
  Sender: TObject);
begin
  inherited;
 if FObra_Param = Nil then
    FObra_Param := TFObra_Param.Create(Application);
  FObra_Param.PGRelatorio.Pages[2].TabVisible := True;
  if FObra_Param.ShowModal = mrOk then
  with DMMaquinaMov do
  begin
    QRMaquinaMov.Close;
    if Trim(FObra_Param.Me3Operador.Text) = '' then
      QRMaquinaMov.SetVariable('OPERADOR',Null)
    else
      QRMaquinaMov.SetVariable('OPERADOR',StrToInt(Trim(FObra_Param.Me3Operador.Text)));
    if Trim(FObra_Param.ME3Filial.Text) = '' then
      QRMaquinaMov.SetVariable('FILIAL',Null)
    else
      QRMaquinaMov.SetVariable('FILIAL',StrToInt(Trim(FObra_Param.ME3Filial.Text)));
    if Trim(FObra_Param.ME3Obra.Text) = '' then
      QRMaquinaMov.SetVariable('OBRA',Null)
    else
      QRMaquinaMov.SetVariable('OBRA',StrToInt(Trim(FObra_Param.ME3Obra.Text)));
    if Trim(FObra_Param.Me3DtInicial.Text) <> '' then
      QRMaquinaMov.SetVariable('DT_INICIAL',StrToDate(FObra_Param.Me3DtInicial.Text))
    else
      Raise Exception.Create('Período deve ser informado');
    if Trim(FObra_Param.Me3DtFinal.Text) = '' then
      FObra_Param.ME3DtFinal.Text := DateToStr(Date);
    QRMaquinaMov.SetVariable('DT_FINAL',StrToDate(FObra_Param.Me3DtFiNAL.Text));
    QRMaquinaMov.Open;
    if FRMaquinaMov = Nil then
      FRMaquinaMov := TFRMaquinaMov.Create(Application);
    FRMaquinaMov.QRLFilial.Caption := FObra_Param.Ed3Filial.Text;
    FRMaquinaMov.QRLTitulo.Caption := 'Relação de Movimentação de Máquinas De '+FObra_Param.Me3DtInicial.Text + ' Até ' + FObra_Param.Me3DtFinal.Text;
    if FObra_Param.RGPreview.ItemIndex = 0 then
       FRMaquinaMov.QRPrimario.Preview
    else
      FRMaquinaMov.QRPrimario.Print;
    QRMaquinaMov.Close;
  end;
end;



end.
