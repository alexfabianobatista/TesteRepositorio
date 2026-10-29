unit UCIAPCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, DBDirceu, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, ActnList;

type
  TFCIAPCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    SBFator: TSpeedButton;
    Label7: TLabel;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    SBPatrimonio: TSpeedButton;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    DBDirceu1: TDBDirceu;
    DBDirceu2: TDBDirceu;
    DBDirceu3: TDBDirceu;
    DBDirceu4: TDBDirceu;
    DBDirceu5: TDBDirceu;
    Opes1: TMenuItem;
    Gerarnoperodo1: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure SBFatorClick(Sender: TObject);
    procedure SBPatrimonioClick(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
    procedure Gerarnoperodo1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCIAPCad: TFCIAPCad;

implementation

uses UCIAP_cl, UFatorICMSCons, UFatorICMS_cl, UPatrimonioItensCons,
  UPatrimonio_cl, UCIAPCons, UCIAPParam, UOracle_cl;

{$R *.DFM}

procedure TFCIAPCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMCIAP.QCIAP.Close;
  DMCIAP.QCIAP.Open;
end;

procedure TFCIAPCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  If not (DSPrimario.State in [dsInsert,dsEdit]) Then
  begin
    SBPatrimonio.Enabled := False;
    SBFator.Enabled := False;
  end
  Else
  begin
    SBPatrimonio.Enabled := True;
    SBFator.Enabled := True;
  end;
end;

procedure TFCIAPCad.SBFatorClick(Sender: TObject);
begin
  inherited;
  if FFatorICMSCons = nil then
    FFatorICMSCons := TFFatorICMSCons.create(application);

  if FFatorICMSCons.ShowModal = mrok then
  begin
    DMCIAP.QCIAPCOD_FATOR_ICMS.Value := dmfatorICMS.QFatorICMSConsCOD_FATOR_ICMS.Value;
  end;
end;

procedure TFCIAPCad.SBPatrimonioClick(Sender: TObject);
begin
  inherited;
  if FPatrimonioItensCons = nil then
    FPatrimonioItensCons := TFPatrimonioItensCons.create(application);

  if FPatrimonioItensCons.showmodal = mrok then
  begin
    DMCIAP.QCIAPCOD_PATRIMONIO_ITEM.Value := DMPatrimonio.QPatrimonioItemConsCOD_PATRIMONIO_ITEM.Value;
  end;
end;

procedure TFCIAPCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FCIAPCons = nil then
    FCIAPCons := TFCIAPCons.create(application);

  if FCIAPCons.ShowModal = mrok then
  begin
    DMCIAP.QCIAP.Close;
    DMCIAP.QCIAP.SetVariable( ':PK', DMCIAP.QCIAPConsCOD_CONTROLE_CREDITO_ICMS.Value );
    DMCIAP.QCIAP.Open;
  end;
end;

procedure TFCIAPCad.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext(5);
end;


//--------------------------------------
Function PrimeiroDiaDoMes (Data : TDateTime) : TDateTime;
var
  Ano, Mes, Dia : word;
  DiaDaSemana : Integer;
begin
  DecodeDate (Data, Ano, Mes, Dia);
  Dia := 1;
  primeiroDiaDoMes := EncodeDate (Ano, Mes, Dia);
end;

Function UltimoDiaDoMes (Data : TDateTime) : TDateTime;
var
  AuxData : TDateTime;
  DiaDaSemana : Integer;
begin
  AuxData := primeiroDiaDoMes (IncMonth(Data,1)) - 1;
  UltimoDiaDoMes := AuxData;
end;
//--------------------------

procedure TFCIAPCad.Gerarnoperodo1Click(Sender: TObject);
var
  dti, dtf : TDate;
  Year, Month, Day: Word;
  wVal : string;
  wCodFilial : integer;
  wEstado : boolean;
begin
  inherited;
  IF FCIAPParam = nil then
    FCIAPParam := TFCIAPParam.create(application);

  FCIAPParam.PGRelatorio.Pages[0].TabVisible := True;
  if FCIAPParam.showmodal = mrok then
  begin
    if TRIM(FCIAPParam.ME0CodPatrimonioItem.Text) = '' then
      raise Exception.create('Infome o patrimônio');
    if FCIAPParam.me0dtinicio.Text = '' then
      raise Exception.Create('Informe a data de início');
    if FCIAPParam.ME0DtFim.Text = '' then
      raise Exception.Create('Informe a data de fim');
    if StrToDate(FCIAPParam.ME0DtInicio.Text) > StrToDate(FCIAPParam.ME0DtFim.Text) then
      raise Exception.Create('A data de início é maior que a de fim');

    dti := StrToDate(FCIAPParam.ME0DtInicio.Text);
    dtf := StrToDate(FCIAPParam.ME0DtFim.Text);

    dti := UltimoDiaDoMes(dti);
    dtf := UltimoDiaDoMes(dtf);

    wVal := DMOracle.BuscaNome('SELECT COD_FILIAL FROM TB_PATRIMONIO_ITEM','COD_PATRIMONIO_ITEM = ' + Trim(FCIAPParam.ME0CodPatrimonioItem.Text));
    wCodFilial := strtoint(wVal);

    wEstado := DMCIAP.QCIAP.CommitOnPost;
    DMCIAP.QCIAP.CommitOnPost := false;
    DMOracle.DBCemapa.StartTransaction;
    try
      while true do
      begin
        DecodeDate(dti, Year, Month, Day);

        wVal := DMOracle.BuscaNome('SELECT COD_FATOR_ICMS FROM TB_FATOR_ICMS','NUM_ANO = ' + IntToStr(Year) + ' AND NUM_MES = ' + IntToStr(Month) + ' AND COD_FILIAL = ' + IntToStr(wCodFilial));
        if wVal = '' then
          raise Exception.Create('Não foi encontrado fator para ' + IntToStr(Month)+'/'+IntToStr(Year)+' na filial '+IntToStr(wCodFilial));

        DMCIAP.QCIAP.Insert;
        DMCIAP.QCIAPCOD_PATRIMONIO_ITEM.Value := StrToInt(TRIM(FCIAPParam.ME0CodPatrimonioItem.Text));
        DMCIAP.QCIAPCOD_FATOR_ICMS.Value      := StrToInt(wVal);
        //DMCIAP.QCIAPVAL_CREDITO.Value         := StrToFloat(Trim(FCIAPParam.ME0ValorCredito.Text));
        DMCIAP.QCIAP.Post;

        dti := UltimoDiaDoMes(dti + 1); //dti + 1 --> passa para o primeiro dia do proximo mes, e a funcao retorna o ultimo dia desse mes

        if dti > dtf then
          break; //sai do loop
      end;
      DMOracle.DBCemapa.Commit;
      DMCIAP.QCIAP.CommitOnPost := wEstado; //volta ao estado normal, antes de chamar essa procedure

      MessageDlG('CIAP gerado com sucesso.',mtInformation,[MBOK],0);      
    except
      DMCIAP.QCIAP.CommitOnPost := wEstado; //volta ao estado normal, antes de chamar essa procedure
      DMOracle.DBCemapa.Rollback;
      raise;
    end;
  end;
end;

procedure TFCIAPCad.FormCreate(Sender: TObject);
begin
  inherited;
  if DSPrimario.DataSet = nil then
    DSPrimario.DataSet := DMCIAP.QCIAP;
end;

end.
