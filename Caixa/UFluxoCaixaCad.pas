unit UFluxoCaixaCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, variants, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, ActnList;

type
  TFFluxoCaixaCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    BtFilialCons: TSpeedButton;
    BtDeptoCons: TSpeedButton;
    DBEdit8: TDBEdit;
    DBEdit4: TDBEdit;
    Label4: TLabel;
    DBEdit7: TDBEdit;
    Movimento1: TMenuItem;
    Label7: TLabel;
    DBEdit9: TDBEdit;
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure BtFilialConsClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure BtDeptoConsClick(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure SBIncluirClick(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure Movimento1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FFluxoCaixaCad: TFFluxoCaixaCad;

implementation

uses UFilialCons, UFilial_cl, UDepartamento_cl, UOracle_cl,
  UDepartamentoCons, UFluxoCaixaCons, UUsuario_cl, UFluxoCaixa_cl,
  UCaixaParam, URMovimento;

{$R *.DFM}

procedure TFFluxoCaixaCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  If DSPrimario.State in [DSInsert,DSEdit] then
    begin
      BtFilialCons.Enabled:=True;
      BtDeptoCons.Enabled:=True;
    end
  Else
    begin
      BtFilialCons.Enabled:=False;
      BtDeptoCons.Enabled:=False;
    end;

end;

procedure TFFluxoCaixaCad.BtFilialConsClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal=MrOk then
    DMFluxoCaixa.QFluxo_CaixaCOD_FILIAL.Value := DMFilial.QFilialConsCod_Filial.Value;

end;

procedure TFFluxoCaixaCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMFilial.QFilialCons.Close;
  DMDepartamento.QDepartamentoCons.Close;
  DMFluxoCaixa.QFluxo_Caixa_Cons.Close;
  DMFluxoCaixa.QFluxo_Caixa.Close;
  Action:= CaFree;
  FFluxoCaixaCad:= Nil;
end;

procedure TFFluxoCaixaCad.FormActivate(Sender: TObject);
begin
//  inherited;
  DMFluxoCaixa.QFluxo_Caixa.Open;
end;

procedure TFFluxoCaixaCad.BtDeptoConsClick(Sender: TObject);
begin
  inherited;
  if FDepartamentoCons = Nil then
    FDepartamentoCons := TFDepartamentoCons.Create(Application);
  if FDepartamentoCons.ShowModal=MrOk then
    DMFluxoCaixa.QFluxo_CaixaCOD_DEPARTAMENTO.Value:= DMDepartamento.QDepartamentoConsCod_Departamento.Value;
end;

procedure TFFluxoCaixaCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FFluxoCaixaCons = Nil then
    FFluxoCaixaCons:= TFFluxoCaixaCons.Create(Application);
  If FFluxoCaixaCons.Showmodal = MrOk then
  Begin
    DMFluxoCaixa.QFluxo_Caixa.Close;
    DMFluxoCaixa.QFluxo_Caixa.SetVariable('PK',DMFluxoCaixa.QFluxo_Caixa_ConsCOD_FLUXO_CAIXA.Value);
    DMFluxoCaixa.QFluxo_Caixa.Open;
  End;
end;

procedure TFFluxoCaixaCad.SBIncluirClick(Sender: TObject);
begin
  inherited;
  DMFluxoCaixa.QFluxo_CaixaDT_FLUXO_CAIXA.Value:= Date();
end;

procedure TFFluxoCaixaCad.SBConfirmarClick(Sender: TObject);
begin
  DmUsuario.Checar_Filial_Usuario(DMFluxoCaixa.QFluxo_CaixaCOD_FILIAL.Text,'CAIXA'); //SEGURANÇA FILIAL
  inherited;
end;

procedure TFFluxoCaixaCad.Movimento1Click(Sender: TObject);
begin
  inherited;
  If FCaixaParam=Nil then
    FCaixaParam:=TFCaixaParam.Create(Application);
  FCaixaParam.PGRelatorio.Pages[10].TabVisible:=True;
  If FCaixaParam.ShowModal=MrOk then
  begin
    with DMFluxoCaixa do
     begin
       QRMovimento.Close;
      if Trim(FCaixaParam.ME10Filial.Text)<>'' then
        QRMovimento.SetVariable('FILIAL',StrToInt(Trim(FCaixaParam.ME10Filial.Text)))
      else
        QRMovimento.SetVariable('FILIAL',Null);
      if Trim(FCaixaParam.Me10Departamento.Text)<>'' then
        QRMovimento.SetVariable('DEPARTAMENTO',StrToInt(Trim(FCaixaParam.Me10Departamento.Text)))
      else
       QRMovimento.SetVariable('DEPARTAMENTO',Null);

      if ((FCaixaParam.ME10DtInicial.Text = '') or (FCaixaParam.ME10DtFinal.Text = '')) then
        Raise Exception.Create('A Data deve ser Informada');
        QRMovimento.SetVariable('DT_INICIAL',StrToDate(Trim(FCaixaParam.ME10DtInicial.Text)));
        QRMovimento.SetVariable('DT_FINAL',StrToDate(Trim(FCaixaParam.ME10DtFinal.Text)));

       QRMovimento.Open;

       if FRMovimento = Nil then
          FRMovimento:=TFRMovimento.Create(Application);
       FRMovimento.QRLFilial.Caption:='Filial:'+FCaixaParam.Ed10Filial.Text;
       FRMovimento.QRLPeriodo.Caption:='Periodo:'+FCaixaParam.ME10DtInicial.Text+' até: '+FCaixaParam.ME10DtFinal.Text;
       FRMovimento.QRLDepartamento.Caption:='Departamento:'+FCaixaParam.Ed10Departamento.Text;
       If FCaixaParam.RGPreview.ItemIndex = 0 then
          FRMovimento.QRPrimario.Preview
       Else
          FRMovimento.QRPrimario.Print;
       QRMovimento.Close;

     end;
   end;
end;

procedure TFFluxoCaixaCad.FormCreate(Sender: TObject);
begin
  inherited;
  if DSPrimario.DataSet = nil then
    DSPrimario.DataSet := DMFluxoCaixa.QFluxo_Caixa;
end;

procedure TFFluxoCaixaCad.DBEdit2Exit(Sender: TObject);
begin
  inherited;
  DMOracle.ValidaFilial(DBEdit2.Text);
end;

end.
